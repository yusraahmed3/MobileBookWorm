import 'dart:ffi';

import 'package:book_worm/screens/bookdetail.dart';
import 'package:book_worm/screens/firstpage.dart';
import 'package:book_worm/screens/homepage.dart';
import 'package:book_worm/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:book_worm/screens/login.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() {
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    initialRoute: '/',
    routes: {
      '/login': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/home': (context) => HomePage(),
      '/book': (context) => BookDetail(),
    },
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
