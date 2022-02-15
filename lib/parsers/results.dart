import 'package:altdict/models/result_model.dart';
import 'package:altdict/network/search_service.dart';

class Results {
  Future<ApiResult> getSearchResult(String input) async {
    final response = await SearchService().getSearchResponse(input);
    return apiResultFromJson(response);
  }
}