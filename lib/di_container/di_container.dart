import 'package:era_developers_test_flutter/common/data/remote/remote_data.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/mock_news_repository.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/providers/article_provider.dart';
import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/common/widgets/app/my_app.dart';
import 'package:flutter/material.dart';

abstract class DiContainerProvider {
  Widget makeApp();
  AbstractNewsRepository makeNewsRepository();
  DataClientModel makeDataClient();
  Articles makeArticles();
  Article makeArticle();
  ArticleHolder makeArticleHolder();
  ArticlesProviderModel makeArticlesProvider();
}

class DiContainer implements DiContainerProvider {
  final MainNavigation _mainNavigation = MainNavigation();

  @override
  Widget makeApp() => MyApp(navigation: _mainNavigation);
  @override
  Articles makeArticles() => Articles();
  @override
  ArticleHolder makeArticleHolder() => ArticleHolder();
  @override
  Article makeArticle() => Article(
        id: '',
        haveRead: false,
        imageUrl: '',
        publicationDate: DateTime.now(),
        title: '',
        description: '',
      );
  @override
  ArticlesProviderModel makeArticlesProvider() =>
      ArticlesProvider(articles: makeArticles());
  @override
  DataClientModel makeDataClient() =>
      DataClient(repository: makeNewsRepository());
  @override
  AbstractNewsRepository makeNewsRepository() => MockNewsRepository();

  DiContainer();
}
