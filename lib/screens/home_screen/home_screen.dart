import 'package:era_developers_test_flutter/i18n/strings.g.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/screens/widgets/app_bar/text_menu_on_tap.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:era_developers_test_flutter/screens/widgets/shared_content.dart';
import 'package:era_developers_test_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:timeago/timeago_en.dart';

part 'parts/features.dart';
part 'parts/latest_news.dart';

abstract class HomeScreenModel {
  List<Article> get articleList;
  int get articleListLength;
}

class HomeScreenStore implements HomeScreenModel {
  final Articles articles;

  HomeScreenStore({required this.articles});

  @override
  List<Article> get articleList => articles.articleList;
  @override
  int get articleListLength => articles.articleList.length;
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
  Future markAllRead() async {}

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
