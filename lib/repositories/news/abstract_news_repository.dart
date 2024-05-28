import 'dart:ffi';

import 'package:era_developers_test_flutter/repositories/news/models/article.dart';

abstract class AbstractNewsRepository {
  Future<List<dynamic>> getLatestArticles();
  Future<List<dynamic>> getFeaturedArticles();
  Future<dynamic> getArticle(String id);
}
