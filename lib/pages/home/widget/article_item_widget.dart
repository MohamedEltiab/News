import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/config/pages_route_name.dart';
import '../../../main.dart';
import '../../models/article_model.dart';



class ArticleItemWidget extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticleItemWidget({
    super.key,
    required this.articleModel,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      // Navigator.pushNamed(context,
        // ArticleDetailsView.routeName,
        navigatorKey.currentState!.pushNamed(
          PagesRouteName.articleDetailsView,
          arguments: articleModel,
      );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 230,
              width: Constant.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: CachedNetworkImage(
                imageUrl: articleModel.urlToImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: 45,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              articleModel.source.name,
              textAlign: TextAlign.start,
              style: Constant.theme.textTheme.bodySmall
                  ?.copyWith(color: Color(0xFF79828B)),
            ),
            //Expected a value of type "Date Time",but got onn of type "String
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    articleModel.title,
                    textAlign: TextAlign.start,
                    style: Constant.theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF42505C), fontSize: 18, height: 1.1),
                  ),
                ),
              Expanded(child: Text(

                timeAgo(DateTime.parse(articleModel.publishedAt)),
                textAlign: TextAlign.end,
                style: Constant.theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF42505C), fontSize: 18, height: 1.1),
              ),)
             ,
              ],
            )

          ],
        ),
      ),
    );
  }
  String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} day ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min ago';
    } else {
      return 'منذ قليل';
    }
  }


}