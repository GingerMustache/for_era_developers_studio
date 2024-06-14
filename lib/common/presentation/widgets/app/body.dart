import 'dart:ui';

import 'package:era_developers_test_flutter/common/application/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Body extends StatelessWidget {
  final Widget children;
  final dynamic store;
  final Function? refresh;

  const Body({
    super.key,
    required this.children,
    this.store,
    this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.mainWhite,
        ),
        RefreshIndicator(
            color: AppColors.mainWhite,
            backgroundColor: AppColors.mainBlack,
            onRefresh: () async => refresh == null ? () {} : refresh!(),
            child: children),
        Observer(
          builder: (context) => store != null && store!.isLoading.value
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
