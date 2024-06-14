import 'dart:developer' as devtools;

import 'package:era_developers_test_flutter/common/data/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/article_holder.dart';

abstract class DataClientModel {
  Future<void> getFeaturedArticles(List<Article> articleList);
  Future<bool> getLatestArticles(List<Article> articleList);
  Future<bool> getArticle(
      {required ArticleHolder articleHolder, required String id});
}

class DataClient implements DataClientModel {
  final AbstractNewsRepository repository;

  DataClient({
    required this.repository,
  });

  @override
  Future<void> getFeaturedArticles(List<Article> articleList) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      articleList.addAll(await repository.getFeaturedArticles());
    } catch (e) {
      devtools.log(e.toString());
    }
  }

  @override
  Future<bool> getLatestArticles(List<Article> articleList) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      articleList.addAll(await repository.getLatestArticles());
    } catch (e) {
      devtools.log(e.toString());
      return false;
    }
    return true;
  }

  @override
  Future<bool> getArticle(
      {required ArticleHolder articleHolder, required String id}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final Article article = (await repository.getArticle(id));
      articleHolder.fromArticle(article);
      return true;
    } catch (e) {
      devtools.log(e.toString());
    }
    return false;
  }
}
