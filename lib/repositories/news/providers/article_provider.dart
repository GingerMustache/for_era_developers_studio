import 'package:era_developers_test_flutter/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';

abstract class ArticlesProviderModel {}

class ArticlesProvider {
  final Article article;

  final AbstractNewsRepository newsRepository;

  ArticlesProvider({
    required this.article,
    required this.newsRepository,
  });
}
