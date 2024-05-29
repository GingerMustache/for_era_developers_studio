import 'package:era_developers_test_flutter/di_container/di_container.dart';
import 'package:era_developers_test_flutter/screens/home_screen/home_screen.dart';
import 'package:era_developers_test_flutter/screens/init_screen/init_screen.dart';
import 'package:era_developers_test_flutter/screens/news_screen/news_screen.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';

void initStore(DiContainerProvider diContainer) {
  getIt.registerLazySingleton<InitScreenModel>(() => InitScreenStore(
        articles: diContainer.makeArticles(),
        dataClient: diContainer.makeDataClient(),
      ));
  getIt.registerLazySingleton<HomeScreenModel>(() => HomeScreenStore(
        articles: diContainer.makeArticles(),
        articlesProvider: diContainer.makeArticlesProvider(),
      ));
  getIt.registerLazySingleton<NewsScreenModel>(() => NewsScreenStore(
      dataClient: diContainer.makeDataClient(),
      article: diContainer.makeArticle()));
}
