import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../network/api_manager.dart';
import '../../models/article_model.dart';
import 'article_item_widget.dart';



class ArticleListWidget extends StatelessWidget {
  final String sourceId;

  const ArticleListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                ArticleItemWidget(articleModel: articlesList[index]),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }
}