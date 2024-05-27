import 'package:era_developers_test_flutter/di_container/di_container.dart';
import 'package:era_developers_test_flutter/i18n/strings.g.dart';
import 'package:flutter/material.dart';

void main() async {
  final DiContainerProvider diContainer = DiContainer();
  WidgetsFlutterBinding.ensureInitialized();
  final app = diContainer.makeApp();
  initStores(diContainer);

  runApp(TranslationProvider(child: app));
}
