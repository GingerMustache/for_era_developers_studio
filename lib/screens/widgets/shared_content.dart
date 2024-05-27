import 'package:era_developers_test_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

const mainPadding = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 20,
);

Decoration gradientDecoration() => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Colors.deepPurple,
          Color.fromARGB(255, 195, 49, 221),
        ],
      ),
    );

final scaleButtonDecoration = ButtonStyle(
  foregroundColor: const MaterialStatePropertyAll(AppColors.mainWhite),
  backgroundColor: MaterialStatePropertyAll(
    Colors.white.withAlpha(40),
  ),
);

Decoration mainBoxDecoration() => BoxDecoration(
      color: AppColors.mainWhite,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2)),
      ],
      border: Border(
        top: BorderSide(
          color: AppColors.withAlpha,
          width: 1,
        ),
      ),
    );

const sectionTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
