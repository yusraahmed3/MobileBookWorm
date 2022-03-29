import 'package:book_worm/misc/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

class MainAppButton extends StatelessWidget {
  String text;
  Color textColor;
  Color borderColor;
  Color backColor;
  MainAppButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.backColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 60,
      decoration: BoxDecoration(
          color: backColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
