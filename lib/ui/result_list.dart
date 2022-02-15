import 'package:flutter/material.dart';
import 'package:altdict/models/result_manager.dart';
import 'package:altdict/models/result_model.dart';
import 'package:altdict/parsers/results.dart';
import 'package:provider/provider.dart';

class ResultList extends StatefulWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  List<Result> currentSearchList = [];

  // late String word;
  @override
  Widget build(BuildContext context) {
    return Consumer<ResultManager>(
      builder: (context, resultManager, child) {
        return FutureBuilder(
          future: Results().getSearchResult(resultManager.suggestion),
          builder: (BuildContext context, AsyncSnapshot<ApiResult> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final query = snapshot.data;
              if (query != null) {
                currentSearchList.clear();
                currentSearchList.addAll(query.aResults);
                currentSearchList.addAll(query.bResults);
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("🇬🇧 " +
                        currentSearchList[index].termA +
                        ' ⇔ ' +
                        currentSearchList[index].termB +
                        " 🇹🇷"),
                    trailing: Text(currentSearchList[index].termTypeTextB),
                    subtitle: Text(currentSearchList[index].categoryTextB),
                  );
                },
                itemCount: currentSearchList.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
