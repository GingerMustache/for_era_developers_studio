import 'package:mobx/mobx.dart';

class Article {
  const Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  final bool readed;
  final String? description;
}

class Articles {
  static final Articles _shared = Articles._sharedInstance();
  Articles._sharedInstance();
  factory Articles() => _shared;

  final ObservableList<Article> articleList = ObservableList<Article>();
}
