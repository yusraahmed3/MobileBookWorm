import 'package:book_worm/misc/colors.dart';
import 'package:book_worm/screens/homepage.dart';
import 'package:book_worm/widgets/input_fields.dart';
import 'package:book_worm/widgets/large_text.dart';
import 'package:book_worm/widgets/main_button.dart';
import 'package:book_worm/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:book_worm/screens/signup.dart';

class SignIn extends StatelessWidget {
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
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  LargeText(
                    text: "Login",
                    size: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  NormalText(text: "Login to your account"),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(children: [
                  InputFields(label: 'Email'),
                  InputFields(
                    label: 'Password',
                    obscureText: true,
                  )
                ]),
              ),
              InkWell(
                onTap: (() => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()))),
                child: MainAppButton(
                  backColor: AppColors.secColor,
                  text: "Login",
                  textColor: AppColors.white,
                  borderColor: AppColors.secColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(text: "Don't have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SignUp()))),
                      child: InkWell(
                        onTap: (() => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()))),
                        child: NormalText(
                          text: "Register",
                          textColor: Colors.blue,
                        ),
                      ))
                ],
              )
            ],
          )),
    );
  }
}
