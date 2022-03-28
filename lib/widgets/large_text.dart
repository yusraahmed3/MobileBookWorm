import 'package:book_worm/misc/colors.dart';
import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  String text;
  Color textColor;
  double size;
  LargeText(
      {Key? key,
      required this.text,
      this.textColor = AppColors.textColor,
      this.size = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
