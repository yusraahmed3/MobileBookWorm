import 'package:book_worm/misc/colors.dart';
import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  String text;
  Color textColor;
  double size;
  NormalText(
      {Key? key,
      required this.text,
      this.textColor = AppColors.textColor2,
      this.size = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: textColor),
    );
  }
}
