import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:altdict/models/result_manager.dart';
import '../parsers/suggestions.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10.0,
          ),
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Search...'),
            ),
            suggestionsCallback: (pattern) async {
              final suggestions = Suggestions();
              return await suggestions.toList(pattern);
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion as String),
              );
            },
            onSuggestionSelected: (suggestion) {
              Provider.of<ResultManager>(context, listen: false)
                  .passSuggestion(suggestion);
            },
          ),
        ],
      ),
    );
  }
}
