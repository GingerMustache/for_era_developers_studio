import 'package:era_developers_test_flutter/data/remote_data/remote_data.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:era_developers_test_flutter/routers/routes.dart';
import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:era_developers_test_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class InitScreenModel {
  Future<bool> setData();
}

class InitScreenStore implements InitScreenModel {
  final DataClientModel dataClient;
  final Articles articles;

  Future<bool> setData() =>
      dataClient.getFeaturedArticles(articles.articleList);

  InitScreenStore({
    required this.articles,
    required this.dataClient,
  });
}

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  InitScreenState createState() => InitScreenState();
}

class InitScreenState extends State<InitScreen> {
  Future<bool>? _data;
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
        builder: (context, AsyncSnapshot<bool> snapshot) => Stack(
          children: [
            Container(
              color: AppColors.mainWhite,
            ),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      );
}
