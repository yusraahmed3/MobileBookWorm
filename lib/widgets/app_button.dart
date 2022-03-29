import 'package:book_worm/misc/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String? text;
  bool isIcon;
  Color textColor;
  Color backgroundColor;
  Color borderColor;
  double size;
  IconData? icon;
  AppButton(
      {Key? key,
      required this.backgroundColor,
      required this.borderColor,
      this.isIcon = false,
      this.text,
      required this.size,
      this.icon,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: borderColor),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: isIcon == false
            ? Text(
                text!,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            : Icon(
                icon!,
                color: textColor,
              ),
      ),
    );
  }
}
