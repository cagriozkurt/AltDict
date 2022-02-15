import 'package:altdict/network/search_service.dart';
import 'dart:convert';

class Suggestions {
  Future<List<String>> toList(String input) async {
    final response = await SearchService().getQueryResponse(input);
    if (input.isNotEmpty) {
      List<String> stringList =
          (json.decode(response) as List<dynamic>).cast<String>();
      return stringList;
    } else {
      return Future.value([]);
    }
  }
}
