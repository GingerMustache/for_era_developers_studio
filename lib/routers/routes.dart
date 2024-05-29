import 'package:era_developers_test_flutter/screens/home_screen/home_screen.dart';
import 'package:era_developers_test_flutter/screens/init_screen/init_screen.dart';
import 'package:era_developers_test_flutter/screens/news_screen/news_screen.dart';
import 'package:era_developers_test_flutter/screens/widgets/app/my_app.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum MainRoutes { home, newsScreen, init }

String mainRoutesName(MainRoutes name) => switch (name) {
      MainRoutes.init => 'InitScreen',
      MainRoutes.home => 'HomeScreen',
      MainRoutes.newsScreen => 'NewsScreen',
    };

String mainRoutesPath(MainRoutes name) => switch (name) {
      MainRoutes.init => '/',
      MainRoutes.home => '/home',
      MainRoutes.newsScreen => '/news_screen',
    };

class MainNavigation implements MyAppNavigation {
  @override
  final GoRouter router = GoRouter(
    initialLocation: mainRoutesPath(MainRoutes.init),
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: mainRoutesName(MainRoutes.init),
        path: mainRoutesPath(MainRoutes.init),
        builder: (BuildContext context, GoRouterState state) {
          return const InitScreen();
        },
      ),
      GoRoute(
        name: mainRoutesName(MainRoutes.home),
        path: mainRoutesPath(MainRoutes.home),
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: mainRoutesName(MainRoutes.newsScreen),
        path: mainRoutesPath(MainRoutes.newsScreen),
        builder: (BuildContext context, GoRouterState state) {
          final newsId = state.extra;
          return NewsScreen(
            newsId: newsId.toString(),
          );
        },
      ),
    ],
  );
}
