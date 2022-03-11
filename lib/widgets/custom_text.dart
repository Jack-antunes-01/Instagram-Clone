import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;

  const CustomText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? white,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 14,
      ),
    );
  }
}
