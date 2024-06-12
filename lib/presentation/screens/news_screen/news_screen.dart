import 'dart:ui';

import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/data/remote/remote_data.dart';
import 'package:era_developers_test_flutter/common/typography/typography.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/article_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

part 'news_screen_model.dart';

const Duration _duration = Duration(milliseconds: 800);

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
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              color: AppColors.mainWhite,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    leading: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back),
                      color: AppColors.mainWhite,
                    ),
                    pinned: true,
                    backgroundColor: AppColors.mainBlack,
                    expandedHeight: 350,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      titlePadding: const EdgeInsets.only(
                        left: 25,
                        bottom: 20,
                      ),
                      title: Text(
                        model.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.medium.copyWith(fontSize: 20),
                      ).animate().fadeIn().slideX(
                            duration: _duration,
                          ),
                      background: Container(
                        // height: 450,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.mainBlack,
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7),
                              BlendMode.darken,
                            ),
                            fit: BoxFit.cover,
                            image: NetworkImage(model.image),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(5, 5))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: mainPadding.copyWith(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.description,
                            style: TextStyles.regular.copyWith(fontSize: 16),
                          )
                              .animate()
                              .fadeIn(duration: const Duration(seconds: 1)),
                          Space.v10,
                          Container(
                            height: 300,
                            decoration: mainBoxDecoration(
                              image: model.image,
                              isFiltered: false,
                              isShadow: false,
                            ),
                          ).animate().fadeIn(
                              duration: const Duration(milliseconds: 700)),
                        ],
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
