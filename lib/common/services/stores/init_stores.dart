import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/services/di_container/di_container.dart';
import 'package:era_developers_test_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:era_developers_test_flutter/presentation/screens/init_screen/init_screen.dart';
import 'package:era_developers_test_flutter/presentation/screens/news_screen/news_screen.dart';

void initStore(DiContainerProvider diContainer) {
  getIt.registerLazySingleton<InitScreenModel>(() => InitScreenStore(
        articles: diContainer.makeArticles(),
        dataClient: diContainer.makeDataClient(),
      ));
  getIt.registerLazySingleton<HomeScreenModel>(() => HomeScreenStore(
        articles: diContainer.makeArticles(),
        articlesProvider: diContainer.makeArticlesProvider(),
        dataClient: diContainer.makeDataClient(),
      ));
  getIt.registerLazySingleton<NewsScreenModel>(() => NewsScreenStore(
      dataClient: diContainer.makeDataClient(),
      articleHolder: diContainer.makeArticleHolder()));
}
