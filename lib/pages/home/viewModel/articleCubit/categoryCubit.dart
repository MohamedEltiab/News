import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/network/api_manager.dart';

import 'CategoryStates.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(LoadingArticlesStates());

  getNewsArticles(String sourceId) async {
    emit(LoadingArticlesStates());
    try {
      var articles = await ApiManager.fetchDataArticles(sourceId);
      emit(SucessArticlesStates(articles));
    } catch (error) {
      emit(ErrorArticlesStates(error.toString()));
    }
  }
}
