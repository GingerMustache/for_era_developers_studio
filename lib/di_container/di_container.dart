import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/screens/widgets/app/my_app.dart';
import 'package:flutter/material.dart';

abstract class DiContainerProvider {
  Widget makeApp();
  // ImageHolder makeImageHolder();
  // ImageHolderProvider makeImageHolderProvider();
  // TextHolder makeTextHolder();
  // TextHolderProvider makeTextHolderProvider();
  // PermissionService makePermissionService();
  // PhotoService makePhotoService();
}

class DiContainer implements DiContainerProvider {
  final MainNavigation _mainNavigation = MainNavigation();

  // @override
  // PermissionService makePermissionService() => PermissionServiceDefault();
  // @override
  // PhotoService makePhotoService() => PhotoServiceDefault();
  @override
  Widget makeApp() => MyApp(navigation: _mainNavigation);
  // @override
  // ImageHolder makeImageHolder() => ImageHolder();
  // @override
  // ImageHolderProvider makeImageHolderProvider() =>
  //     ImageHolderProviderDefault(imageHolder: makeImageHolder());
  // @override
  // TextHolder makeTextHolder() => TextHolder();
  // @override
  // TextHolderProvider makeTextHolderProvider() => TextHolderProviderDefault(
  //       textHolder: makeTextHolder(),
  //     );

  DiContainer();
}

void initStores(DiContainerProvider diContainer) {
  // getIt.registerLazySingleton<MemeFromScratchStore>(
  //     () => MemeFromScratchStoreDefault(
  //           imageHolder: diContainer.makeImageHolder(),
  //           textHolder: diContainer.makeTextHolder(),
  //           permissionService: diContainer.makePermissionService(),
  //           photoService: diContainer.makePhotoService(),
  //           imageHolderProvider: diContainer.makeImageHolderProvider(),
  //           textHolderProvider: diContainer.makeTextHolderProvider(),
  //         ));
}
