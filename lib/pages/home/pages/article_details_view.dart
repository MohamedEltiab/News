

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../core/widget/CustomerBackgrountWidget.dart';
import '../../models/article_model.dart';
import '../widget/CustomDrawer.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel articleModel;
 // static const String routeName="ArticleDetailsView";
  const ArticleDetailsView({super.key,required this.articleModel});

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as ArticleModel;

    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            SizedBox(width: 50,),
            Icon(Icons.arrow_back),
            Spacer(),
          ],
          // title: Text(
          //   "News Detail"
          // ),
        ),
        drawer: CustomDrawer(onDrawerClicked: () {}),
        body: Column(
          children: [
            SizedBox(
              width: Constant.mediaQuery.size.width,
              height: 90,

            ),
            Container(
              height: 230,
              width: Constant.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
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

              Text(
                articleModel.source.name,
                textAlign: TextAlign.start,
                style: Constant.theme.textTheme.bodySmall
                    ?.copyWith(color: Color(0xFF79828B)),
              ),

            Text(
              articleModel.title,
              textAlign: TextAlign.start,
              style: Constant.theme.textTheme.bodySmall
                  ?.copyWith(color: Color(0xFF79828B)),
            ),
          ],
        ),
      ),
    );
  }
}
