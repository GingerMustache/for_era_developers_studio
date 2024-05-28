import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/screens/widgets/app/my_app.dart';
import 'package:flutter/material.dart';

abstract class DiContainerProvider {
  Widget makeApp();
}

class DiContainer implements DiContainerProvider {
  final MainNavigation _mainNavigation = MainNavigation();

  @override
  Widget makeApp() => MyApp(navigation: _mainNavigation);

  DiContainer();
}

void initStores(DiContainerProvider diContainer) {}
