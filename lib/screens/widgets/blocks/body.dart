import 'dart:ui';

import 'package:era_developers_test_flutter/screens/widgets/constants.dart';
import 'package:era_developers_test_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Body extends StatelessWidget {
  final List<Widget> children;
  final dynamic store;
  final dynamic refresh;

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
            decoration: const BoxDecoration(
          color: AppColors.mainWhite,
        )),
        RefreshIndicator(
          onRefresh: () async => refresh == null ? () {} : refresh!(),
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [...children, Space.v5],
          ),
        ),
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
