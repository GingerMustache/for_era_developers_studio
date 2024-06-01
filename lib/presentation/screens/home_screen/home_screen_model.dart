import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/articles.dart';
import 'package:era_developers_test_flutter/features/news/domain/providers/article_provider.dart';

abstract class HomeScreenModel {
  List<Article> get articleList;
  int get articleListLength;
  bool get haveRead;

  void setArticlesHaveRead();
}

class HomeScreenStore implements HomeScreenModel {
  final Articles articles;
  final ArticlesProviderModel articlesProvider;

  HomeScreenStore({
    required this.articles,
    required this.articlesProvider,
  });

  @override
  List<Article> get articleList => articles.articleList;
  @override
  int get articleListLength => articles.articleList.length;
  @override
  bool get haveRead => articles.articlesHaveRead.value;

  @override
  void setArticlesHaveRead() => articlesProvider.setArticlesDone();
}
