import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/common/localization/i18n/strings.g.dart';
import 'package:era_developers_test_flutter/common/presentation/app_bar/text_menu_on_tap.dart';
import 'package:era_developers_test_flutter/common/routing/routes.dart';
import 'package:era_developers_test_flutter/common/typography/typography.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/articles.dart';
import 'package:era_developers_test_flutter/features/news/domain/providers/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
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
  bool _isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() => _isScrollingDown = true);
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() => _isScrollingDown = false);
    }
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

    return PixelPerfect(
      assetPath: 'assets/pixel_perfect/home_screen.png',
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: _actionButtons(context, model),
          backgroundColor: AppColors.mainWhite,
        ),
        body: Container(
          color: AppColors.mainWhite,
          child: SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
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
                          child: _isScrollingDown
                              ? SizedBox(
                                  key: const ValueKey('vertical'),
                                  height: 120,
                                  child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () => context.pushNamed(
                                            mainRoutesName(
                                                MainRoutes.newsScreen),
                                            extra: model.articleList[index].id),
                                        child: latestNewsView(model, index),
                                      );
                                    },
                                  ),
                                )
                              : SizedBox(
                                  key: const ValueKey('horizontal'),
                                  height: 300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model.articleListLength,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () => context.pushNamed(
                                            mainRoutesName(
                                                MainRoutes.newsScreen),
                                            extra: model.articleList[index].id),
                                        child: featuresNewsView(model, index),
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
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverPersistentHeaderDelegate(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => context.pushNamed(
                              mainRoutesName(MainRoutes.newsScreen),
                              extra: model.articleList[index].id),
                          child: latestNewsView(model, index),
                        ),
                      );
                    },
                    childCount: model.articleListLength,
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

List<Widget> _actionButtons(BuildContext context, HomeScreenModel model) {
  void markAllRead() => model.setArticlesHaveRead();

  return [
    TextMenuOnTap(
      onTap: () {},
      text: t.screen.home.notifications,
    ),
    Space.h15,
    TextMenuOnTap(
      onTap: () => markAllRead(),
      text: t.screen.home.markAllRead,
    ),
  ];
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.mainWhite,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t.screen.home.latestNews,
            style: sectionTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
