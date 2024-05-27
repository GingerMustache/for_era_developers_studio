import 'package:era_developers_test_flutter/screens/home_screen.dart';
import 'package:era_developers_test_flutter/screens/widgets/app/my_app.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum MainRoutes { home }

String mainRoutesName(MainRoutes name) => switch (name) {
      MainRoutes.home => 'HomeScreen',
    };

String mainRoutesPath(MainRoutes name) => switch (name) {
      MainRoutes.home => '/home',
    };

class MainNavigation implements MyAppNavigation {
  @override
  final GoRouter router = GoRouter(
    initialLocation: mainRoutesPath(MainRoutes.home),
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: mainRoutesName(MainRoutes.home),
        path: mainRoutesPath(MainRoutes.home),
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
