
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/config/constants.dart';
import '../pages/models/article_model.dart';
import '../pages/models/source_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchDataSource(String categoryId) async {
    Map<String, dynamic> queryParams = {
      "apiKey": Constant.apiKey,
      "category": categoryId,
    };

    Uri url = Uri.https(
      Constant.baseURL,
      "/v2/top-headlines/sources",
      queryParams,
    );

    final response = await http.get(url);

    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List sourcesList = data["sources"];

      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.formJson(element));
      }

      return sourcesDataList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Sources');
    }
  }

  static Future<List<ArticleModel>> fetchDataArticles(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constant.apiKey,
      "sources": sourceId,
    };
    var url = Uri.https(
      Constant.baseURL,
      "/v2/everything",
      queryParameters,
    );

    var response = await http.get(url);

    List<ArticleModel> articlesList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List articles = data["articles"];

      for (var element in articles) {
        articlesList.add(
          ArticleModel.fromJson(element),
        );
      }
      return articlesList;
    } else {
      throw Exception("Error fetch data articles: ");
    }
  }
}
