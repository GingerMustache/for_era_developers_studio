import 'package:era_developers_test_flutter/common/services/di_container/di_container.dart';
import 'package:era_developers_test_flutter/common/localization/i18n/strings.g.dart';
import 'package:era_developers_test_flutter/common/services/stores/init_stores.dart';
import 'package:flutter/material.dart';

void main() async {
  final DiContainerProvider diContainer = DiContainer();
  WidgetsFlutterBinding.ensureInitialized();
  final app = diContainer.makeApp();
  initStore(diContainer);

  runApp(TranslationProvider(child: app));
}
