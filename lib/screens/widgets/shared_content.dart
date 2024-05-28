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

Decoration mainBoxDecoration({
  required String image,
  required bool isFiltered,
  required bool isShadow,
}) =>
    BoxDecoration(
      color: AppColors.mainBlack,
      image: DecorationImage(
        colorFilter: isFiltered
            ? ColorFilter.mode(
                Colors.black
                    .withOpacity(0.7), // Adjust the opacity for shadow effect
                BlendMode.darken,
              )
            : null,
        fit: BoxFit.cover,
        image: AssetImage(image),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        isShadow
            ? BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 4,
                offset: const Offset(5, 5))
            : BoxShadow()
      ],
      border: Border(
        top: BorderSide(
          color: AppColors.withAlpha,
          width: 1,
        ),
      ),
    );

const sectionTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
