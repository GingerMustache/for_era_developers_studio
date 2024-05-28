import 'package:era_developers_test_flutter/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';

abstract class ArticlesProviderModel {}

class ArticlesProvider {
  final Article article;
  final Articles articles;
  final AbstractNewsRepository newsRepository;

  ArticlesProvider({
    required this.article,
    required this.articles,
    required this.newsRepository,
  });

  Future<bool> getData() async {
    articles.articleDataList
        .addAll((await newsRepository.getLatestArticles()).toList());
    return true;
  }
}
