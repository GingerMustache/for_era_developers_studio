import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/localization/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

abstract class MyAppNavigation {
  RouterConfig<RouteMatchList> get router;
}

class MyApp extends StatelessWidget {
  final MyAppNavigation navigation;

  const MyApp({
    Key? key,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: AppColors.mainBlack,
        ),
      ),
      routerConfig: navigation.router,
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
