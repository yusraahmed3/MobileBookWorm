import 'dart:ffi';

import 'package:book_worm/misc/colors.dart';
import 'package:book_worm/widgets/input_fields.dart';
import 'package:book_worm/widgets/large_text.dart';
import 'package:book_worm/widgets/main_button.dart';
import 'package:book_worm/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:book_worm/screens/login.dart';

import 'homepage.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  LargeText(
                    text: "Register",
                    size: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  NormalText(text: "Create an account")
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(children: [
                  InputFields(label: 'Email'),
                  InputFields(
                    label: "Password",
                    obscureText: true,
                  ),
                  InputFields(
                    label: "Confirm Password",
                    obscureText: true,
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(children: []),
              ),
              MainAppButton(
                  text: "Register",
                  backColor: AppColors.secColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.secColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(text: "Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => SignIn()))),
                    child: NormalText(text: "Login", textColor: Colors.blue),
                  )
                ],
              )
            ],
          )),
    );
  }
}
