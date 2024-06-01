part of "init_screen.dart";

abstract class InitScreenModel {
  Future<bool> setData();
}

class InitScreenStore implements InitScreenModel {
  final DataClientModel dataClient;
  final Articles articles;

  @override
  Future<bool> setData() =>
      dataClient.getFeaturedArticles(articles.articleList);

  InitScreenStore({
    required this.articles,
    required this.dataClient,
  });
}
