import 'dart:ffi';

import 'package:book_worm/misc/colors.dart';
import 'package:book_worm/screens/login.dart';
import 'package:book_worm/screens/signup.dart';
import 'package:book_worm/widgets/large_text.dart';
import 'package:book_worm/widgets/main_button.dart';
import 'package:book_worm/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  LargeText(text: "Welcome"),
                  SizedBox(
                    height: 15,
                  ),
                  NormalText(text: "Read any book right here for free!"),
                ]),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/BookWorm.png'))),
                ),
                MainAppButton(
                    text: "Login",
                    textColor: AppColors.textColor,
                    backColor: AppColors.white,
                    borderColor: AppColors.secColor),
                MainAppButton(
                    text: "Register",
                    textColor: AppColors.white,
                    backColor: AppColors.mainColor,
                    borderColor: AppColors.mainColor)
              ],
            )),
      ),
    );
  }
}
