import 'package:flutter/material.dart';

const String fontFamily = 'SF-Pro-Display';

class TextStyles {
  TextStyles._();

  static TextStyle black =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w900);

  static TextStyle blackItalic =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w800);

  static TextStyle bold =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700);

  static TextStyle heavy =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w600);

  static TextStyle medium =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w500);

  static TextStyle regular =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w400);

  static TextStyle thin =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w300);

  static TextStyle thinItalic =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w200);

  static TextStyle ultraLight =
      const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w100);
}
