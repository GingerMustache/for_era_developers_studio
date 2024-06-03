import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/common/localization/i18n/strings.g.dart';
import 'package:era_developers_test_flutter/common/presentation/app_bar/text_menu_on_tap.dart';
import 'package:era_developers_test_flutter/common/routing/routes.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/articles.dart';
import 'package:era_developers_test_flutter/features/news/domain/providers/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'home_screen_model.dart';
part 'parts/features_news_view.dart';
part 'parts/latest_news_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _previousScrollOffset = 0;
  String _scrollDirection = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double currentScrollOffset = _scrollController.offset;

    if (currentScrollOffset > _previousScrollOffset) {
      setState(() => _scrollDirection = 'Down');
    } else if (currentScrollOffset == 0) {
      setState(() => _scrollDirection = '0');
    } else {
      setState(() => _scrollDirection = 'Up ');
    }

    _previousScrollOffset = currentScrollOffset;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = getIt<HomeScreenModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: _actionButtons(context),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: AppColors.mainWhite,
        child: SafeArea(
          child: Padding(
            padding: mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  t.screen.home.featured,
                  style: sectionTextStyle,
                ),
                AnimatedSwitcher(
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 350),
                  child: ['0', ''].contains(_scrollDirection)
                      ? SizedBox(
                          key: const ValueKey('horizontal'),
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.articleListLength,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => context.pushNamed(
                                    mainRoutesName(MainRoutes.newsScreen),
                                    extra: model.articleList[index].id),
                                child: featuresNewsView(model, index),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: 120,
                          key: const ValueKey('vertical'),
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => context.pushNamed(
                                    mainRoutesName(MainRoutes.newsScreen),
                                    extra: model.articleList[index].id),
                                child: latestNewsView(model, index),
                              );
                            },
                          ),
                        ),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                        sizeFactor: animation,
                        axis: Axis.vertical,
                        child: child,
                      ),
                    );
                  },
                ),
                Space.v10,
                Text(
                  t.screen.home.latestNews,
                  style: sectionTextStyle,
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: model.articleListLength,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => context.pushNamed(
                            mainRoutesName(MainRoutes.newsScreen),
                            extra: model.articleList[index].id),
                        child: latestNewsView(model, index),
                      );
                    },
                  ),
                ),
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
