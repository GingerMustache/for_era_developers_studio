import 'package:flutter/material.dart';

class TextMenuOnTap extends StatelessWidget {
  final Function onTap;
  final double? padding;
  final String text;

  const TextMenuOnTap({
    super.key,
    required this.onTap,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding ?? 20.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
