import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/common/presentation/app_bar/text_menu_on_tap.dart';
import 'package:era_developers_test_flutter/common/routing/routes.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/articles.dart';
import 'package:era_developers_test_flutter/features/news/domain/providers/article_provider.dart';
import 'package:era_developers_test_flutter/common/localization/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'home_screen_model.dart';
part 'parts/features.dart';
part 'parts/latest_news.dart';

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
