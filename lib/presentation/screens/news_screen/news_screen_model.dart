part of 'news_screen.dart';

abstract class NewsScreenModel {
  Future<bool> getArticle(String id);
  String get image;
  String get description;
  String get title;
}

class NewsScreenStore implements NewsScreenModel {
  final ArticleHolder articleHolder;
  final DataClientModel dataClient;

  NewsScreenStore({
    required this.articleHolder,
    required this.dataClient,
  });

  @override
  String get image => articleHolder.imageUrl.value;
  @override
  String get description => articleHolder.description.value ?? '';
  @override
  String get title => articleHolder.title.value;

  @override
  Future<bool> getArticle(String id) =>
      dataClient.getArticle(articleHolder: articleHolder, id: id);
}
