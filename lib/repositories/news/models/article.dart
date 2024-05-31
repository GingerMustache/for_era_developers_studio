import 'package:mobx/mobx.dart';

class Article {
  Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    required this.haveRead,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  bool haveRead;
  final String? description;
}

class Articles {
  static final Articles _shared = Articles._sharedInstance();
  Articles._sharedInstance();
  factory Articles() => _shared;

  final ObservableList<Article> articleList = ObservableList<Article>();
  final Observable<bool> articlesHaveRead = false.obs();
}

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
