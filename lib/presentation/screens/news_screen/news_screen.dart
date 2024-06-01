import 'package:era_developers_test_flutter/common/aplication/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/data/remote/remote_data.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/article_holder.dart';
import 'package:flutter/material.dart';

abstract class NewsScreenModel {
  Future<bool> getArticle(String id);
  String get image;
  String get description;
  String get title;
}

class NewsScreenStore implements NewsScreenModel {
  final ArticleHolder articleHolder;
  final DataClientModel dataClient;

  NewsScreenStore({
    required this.articleHolder,
    required this.dataClient,
  });

  @override
  String get image => articleHolder.imageUrl.value;
  @override
  String get description => articleHolder.description.value ?? '';
  @override
  String get title => articleHolder.title.value;

  @override
  Future<bool> getArticle(String id) =>
      dataClient.getArticle(articleHolder: articleHolder, id: id);
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
                    width: double.infinity,
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
                            model.title,
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
                            Text(
                              model.description,
                              style: const TextStyle(fontSize: 15),
                            ),
                            Space.v10,
                            Container(
                              height: 300,
                              decoration: mainBoxDecoration(
                                image: model.image,
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
