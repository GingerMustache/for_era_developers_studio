import 'package:era_developers_test_flutter/data/remote_data/remote_data.dart';
import 'package:era_developers_test_flutter/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/repositories/news/mock_news_repository.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/screens/widgets/app/my_app.dart';
import 'package:flutter/material.dart';

abstract class DiContainerProvider {
  Widget makeApp();
  AbstractNewsRepository makeNewsRepository();
  DataClientModel makeDataClient();
  Articles makeArticles();
}

class DiContainer implements DiContainerProvider {
  final MainNavigation _mainNavigation = MainNavigation();

  @override
  Widget makeApp() => MyApp(navigation: _mainNavigation);
  @override
  Articles makeArticles() => Articles();
  @override
  DataClientModel makeDataClient() =>
      DataClient(repository: makeNewsRepository());
  @override
  AbstractNewsRepository makeNewsRepository() => MockNewsRepository();

  DiContainer();
}
