import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:era_developers_test_flutter/common/constants/constants.dart';
import 'package:era_developers_test_flutter/common/data/remote/remote_data.dart';
import 'package:era_developers_test_flutter/common/routing/routes.dart';
import 'package:era_developers_test_flutter/features/news/domain/entity/articles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'init_screen_model.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  InitScreenState createState() => InitScreenState();
}

class InitScreenState extends State<InitScreen> {
  Future<void>? _data;
  final model = getIt<InitScreenModel>();

  @override
  void initState() {
    super.initState();
    _data = model.setData();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _data!.whenComplete(
          () => context.goNamed(mainRoutesName(MainRoutes.home)),
        ),
        builder: (context, AsyncSnapshot<void> snapshot) => Stack(
          children: [
            Container(
              color: AppColors.mainWhite,
            ),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      );
}
