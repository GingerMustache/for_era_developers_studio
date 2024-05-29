import 'package:era_developers_test_flutter/i18n/strings.g.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/repositories/news/providers/article_provider.dart';
import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/screens/widgets/app_bar/text_menu_on_tap.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:era_developers_test_flutter/screens/widgets/shared_content.dart';
import 'package:era_developers_test_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'parts/features.dart';
part 'parts/latest_news.dart';

abstract class HomeScreenModel {
  List<Article> get articleList;
  int get articleListLength;
  bool get haveRead;

  void setArticlesHaveRead();
}

class HomeScreenStore implements HomeScreenModel {
  final Articles articles;
  final ArticlesProviderModel articlesProvider;

  HomeScreenStore({
    required this.articles,
    required this.articlesProvider,
  });

  @override
  List<Article> get articleList => articles.articleList;
  @override
  int get articleListLength => articles.articleList.length;

  @override
  bool get haveRead => articles.articlesHaveRead.value;

  @override
  void setArticlesHaveRead() => articlesProvider.setArticlesDone();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: _actionButtons(context),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: AppColors.mainWhite,
        child: const SafeArea(
          child: Padding(
            padding: mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Features(),
                Space.v10,
                LatestNews(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _actionButtons(BuildContext context) {
  final model = getIt<HomeScreenModel>();

  void markAllRead() => model.setArticlesHaveRead();

  return [
    TextMenuOnTap(
      onTap: () {},
      text: t.screen.home.notifications,
    ),
    TextMenuOnTap(
      onTap: () => markAllRead(),
      text: t.screen.home.markAllRead,
    ),
  ];
}
