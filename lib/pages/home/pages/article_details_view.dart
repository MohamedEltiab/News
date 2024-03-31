import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/constants.dart';
import '../../../core/widget/CustomerBackgrountWidget.dart';
import '../../models/article_model.dart';
import '../widget/CustomDrawer.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel articleModel;

  // static const String routeName="ArticleDetailsView";
  const ArticleDetailsView({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ArticleModel;

    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            SizedBox(
              width: 50,
            ),
            Icon(Icons.arrow_back),
            Spacer(),
          ],
          // title: Text(
          //   "News Detail"
          // ),
        ),
        drawer: CustomDrawer(onDrawerClicked: () {}),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              SizedBox(height: 10),
              Text(
                articleModel.author,
                textAlign: TextAlign.start,
                style: Constant.theme.textTheme.bodySmall
                    ?.copyWith(color: Color(0xFF79828B)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                articleModel.title,
                textAlign: TextAlign.start,
                style: Constant.theme.textTheme.bodySmall
                    ?.copyWith(color: Color(0xFF79828B)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                timeAgo(DateTime.parse(articleModel.publishedAt)),
                textAlign: TextAlign.end,
                style: Constant.theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF42505C), fontSize: 18, height: 1.1),
              ),
              SizedBox(height: 20),
              Text(
                articleModel.content,
                textAlign: TextAlign.start,
                style: Constant.theme.textTheme.bodySmall
                    ?.copyWith(color: Color(0xFF79828B)),
              ),
              SizedBox(height: 40),
              /*
                InkWell(
                  onTap: (){
                    _launchURL(articleModel.url);
                  },
                  child: Text(
                  articleModel.url,
                  textAlign: TextAlign.start,
                  style: Constant.theme.textTheme.bodySmall
                      ?.copyWith(color: Color(0xFF79828B
                  )
                  ),
              ),
                )
*/
              Text(
                "View Full Article",
                textAlign: TextAlign.end,
                style: Constant.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.black),
              ),
              IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    _launchURL(articleModel.url);
                  },
                  icon: Icon(Icons.play_arrow_rounded))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // تحويل النص إلى كائن Uri
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
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
