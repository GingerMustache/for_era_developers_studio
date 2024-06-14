part of 'home_screen.dart';

abstract class HomeScreenModel {
  List<Article> get articleList;
  int get articleListLength;
  bool get haveRead;

  void setArticlesHaveRead();
  Future<void> setData();
}

class HomeScreenStore with Loadable implements HomeScreenModel {
  final Articles articles;
  final ArticlesProviderModel articlesProvider;
  final DataClientModel dataClient;

  HomeScreenStore({
    required this.articles,
    required this.articlesProvider,
    required this.dataClient,
  });

  @override
  Future<void> setData() async {
    loadSet();
    dataClient
        .getFeaturedArticles(articles.articleList)
        .then((_) => loadDrop());
  }

  @override
  List<Article> get articleList => articles.articleList;
  @override
  int get articleListLength => articles.articleList.length;
  @override
  bool get haveRead => articles.articlesHaveRead.value;

  @override
  void setArticlesHaveRead() => articlesProvider.setArticlesDone();
}
