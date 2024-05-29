import 'package:era_developers_test_flutter/data/remote_data/remote_data.dart';
import 'package:era_developers_test_flutter/i18n/strings.g.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:era_developers_test_flutter/screens/widgets/shared_content.dart';
import 'package:era_developers_test_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

abstract class NewsScreenModel {
  Future<Article?> getArticle(String id);
  Article get article;
  String get image;
}

class NewsScreenStore implements NewsScreenModel {
  final Article _article;
  final DataClientModel dataClient;

  NewsScreenStore({
    article,
    required this.dataClient,
  }) : _article = article;

  @override
  Article get article => _article;
  @override
  String get image => article.imageUrl;

  @override
  Future<Article?> getArticle(String id) => dataClient.getArticle(id);
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    super.key,
    required this.newsId,
  });
  final String? newsId;

  @override
  Widget build(BuildContext context) {
    final model = getIt<NewsScreenModel>();

    return FutureBuilder(
      future: model.getArticle(newsId ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: AppColors.mainWhite),
            ),
            body: Container(
              color: AppColors.mainWhite,
              child: Column(
                children: [
                  Container(
                    height: 450,
                    decoration: BoxDecoration(
                      color: AppColors.mainBlack,
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(
                              0.7), // Adjust the opacity for shadow effect
                          BlendMode.darken,
                        ),
                        fit: BoxFit.cover,
                        image: NetworkImage(model.image),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(5, 5))
                      ],
                      border: Border(
                        top: BorderSide(
                          color: AppColors.withAlpha,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 40, left: 20, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(child: Space.v20),
                          Text(
                            t.screen.home.testText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.mainWhite,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: mainPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '''Please excuse the interruption.
            
            Due to Google's efforts to maintain a “safe ads ecosystem” for its advertisers, publishers and users from fraud and bad experiences, Google has placed restrictions on our ad serving that limit our ability to provide free VPN services. 
            Regrettably, this is beyond our control.  
            To continue to enjoy ForestVPN without interruptions, please upgrade to our Premium version.''',
                              style: TextStyle(fontSize: 15),
                            ),
                            Space.v10,
                            Container(
                              height: 300,
                              decoration: mainBoxDecoration(
                                image: imageLink,
                                isFiltered: false,
                                isShadow: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
