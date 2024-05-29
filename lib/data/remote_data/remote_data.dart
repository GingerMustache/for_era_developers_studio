import 'package:era_developers_test_flutter/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'dart:developer' as devtools;

abstract class DataClientModel {
  Future<bool> getFeaturedArticles(List<Article> articleList);
  Future<bool> getLatestArticles(List<Article> articleList);
  Future<bool> getArticle(Article article, String id);
}

class DataClient implements DataClientModel {
  final AbstractNewsRepository repository;

  DataClient({
    required this.repository,
  });

  @override
  Future<bool> getFeaturedArticles(List<Article> articleList) async {
    try {
      articleList.addAll(await repository.getFeaturedArticles());
    } catch (e) {
      devtools.log(e.toString());
      return false;
    }
    return true;
  }

  @override
  Future<bool> getLatestArticles(List<Article> articleList) async {
    try {
      articleList.addAll(await repository.getLatestArticles());
    } catch (e) {
      devtools.log(e.toString());
      return false;
    }
    return true;
  }

  @override
  Future<bool> getArticle(Article article, String id) async {
    try {
      article = (await repository.getArticle(id));
    } catch (e) {
      devtools.log(e.toString());
      return false;
    }
    return true;
  }
}