
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'authenticate/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/appLogo.png'),
        nextScreen: LoginPage(),
        backgroundColor: HexColor("#0C9AD6"),
        splashIconSize: 120,

      ),
    );
  }
}