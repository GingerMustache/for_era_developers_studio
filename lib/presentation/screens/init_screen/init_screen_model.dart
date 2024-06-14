part of "init_screen.dart";

abstract class InitScreenModel {
  Future<void> setData();
}

class InitScreenStore implements InitScreenModel {
  final DataClientModel dataClient;
  final Articles articles;

  @override
  Future<void> setData() =>
      dataClient.getFeaturedArticles(articles.articleList);

  InitScreenStore({
    required this.articles,
    required this.dataClient,
  });
}
