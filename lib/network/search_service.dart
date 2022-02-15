import 'package:http/http.dart';

class SearchService {
  Future getQueryResponse(String input) async {
    final String queryApiUrl = 'https://ac.tureng.co/?t=$input&l=entr';
    final response = await get(Uri.parse(queryApiUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Request failed with status: ${response.statusCode}.';
    }
  }

  Future getSearchResponse(String input) async {
    final String searchApiUrl =
        'http://api.tureng.com/v1/dictionary/entr/$input';
    final response = await get(Uri.parse(searchApiUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Request failed with status: ${response.statusCode}.';
    }
  }
}
