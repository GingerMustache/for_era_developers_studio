import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:mobx/mobx.dart';

class Articles {
  static final Articles _shared = Articles._sharedInstance();
  Articles._sharedInstance();
  factory Articles() => _shared;

  final ObservableList<Article> articleList = ObservableList<Article>();
  final Observable<bool> articlesHaveRead = false.obs();
}
