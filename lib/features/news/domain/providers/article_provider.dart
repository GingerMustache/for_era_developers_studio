import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/articles.dart';
import 'package:mobx/mobx.dart';

abstract class ArticlesProviderModel {
  void setArticlesDone();
}

class ArticlesProvider implements ArticlesProviderModel {
  final Articles articles;

  ArticlesProvider({required this.articles});

  @override
  void setArticlesDone() {
    runInAction(() {
      articles.articleList.map((article) => article.haveRead = true);
      articles.articlesHaveRead.value = true;
    });
  }
}
