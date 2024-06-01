import 'package:era_developers_test_flutter/common/data/repositories/news/models/article.dart';
import 'package:mobx/mobx.dart';

class ArticleHolder {
  static final ArticleHolder _shared = ArticleHolder._sharedInstance();
  ArticleHolder._sharedInstance();
  factory ArticleHolder() => _shared;

  final Observable<String> id = ''.obs();
  final Observable<String> title = ''.obs();
  final Observable<DateTime> publicationDate = Observable(DateTime.now());
  final Observable<String> imageUrl = ''.obs();
  final Observable<bool> haveRead = false.obs();
  final Observable<String?> description = ''.obs();

  void fromArticle(Article article) {
    runInAction(() {
      id.value = article.id;
      title.value = article.title;
      publicationDate.value = article.publicationDate;
      imageUrl.value = article.imageUrl;
      haveRead.value = article.haveRead;
      description.value = article.description;
    });
  }
}
