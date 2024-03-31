import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/constants.dart';
import '../../../network/api_manager.dart';
import '../../models/article_model.dart';
import '../viewModel/articleCubit/CategoryStates.dart';
import '../viewModel/articleCubit/categoryCubit.dart';
import 'article_item_widget.dart';
import 'news_list_view.dart';

class ArticleListWidget extends StatelessWidget {
  final String sourceId;

  const ArticleListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    var cubitViewModel = ArticlesCubit();

    return BlocBuilder<ArticlesCubit, ArticlesStates>(
        builder: (context, state) {
      switch (state) {
        case LoadingArticlesStates():
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        case ErrorArticlesStates():
          {
            return Center(
              child: Text(
                state.errorMassage ?? "",
                style: Constant.theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }
        case SucessArticlesStates():
          {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ArticleItemWidget(
                  articleModel: state.articleList[index],
                ),
                itemCount: state.articleList.length,
              ),
            );
          }
      }

      // return widget here based on BlocA's state
    });
  }
}

/*
BlocBuilder<ArticlesCubit, ArticlesStates>(
        bloc:cubitViewModel,

        builder: (context, state)
        {
          switch(state) {
            case LoadingArticlesStates():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorArticlesStates():
              {
                return Center(
                  child: Text(
                    "Something went wrong",
                    style: Constant.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                );
              }
            case SucessArticlesStates():
              {
                return NewsListView(sourcesList: state.ArticleList);
              }
          }

          // return widget here based on BlocA's state
        }
    );
 */
/*
FutureBuilder(
      future: ApiManager.fetchDataArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error fetching articles",
              style: Constant.theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Constant.theme.primaryColor,
            ),
          );
        }

        List<ArticleModel> articlesList = snapshot.data ?? [];

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(articleModel: articlesList[index],),

            itemCount: articlesList.length,
          ),
        );
      },
    );
 */
