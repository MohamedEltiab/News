import '../../../models/article_model.dart';

sealed class ArticlesStates {}

class ErrorArticlesStates extends ArticlesStates {
  String? errorMassage;

  ErrorArticlesStates(this.errorMassage);
}

class SucessArticlesStates extends ArticlesStates {
  List<ArticleModel> articleList;

  SucessArticlesStates(this.articleList);
}

class LoadingArticlesStates extends ArticlesStates {}
