import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:mobx/mobx.dart';

abstract class ArticlesProviderModel {
  void setArticlesDone();
}

class ArticlesProvider implements ArticlesProviderModel {
  final Articles articles;

  ArticlesProvider({required this.articles});

  @override
  void setArticlesDone() => runInAction(
      () => articles.articleList.map((article) => article.haveRead = true));
}
