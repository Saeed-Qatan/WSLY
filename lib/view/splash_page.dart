import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wsly/data/services/auth_service.dart';
import 'package:wsly/view/Admin/main-page.dart';
import 'package:wsly/view/first_page.dart';
import 'package:wsly/view/login_pagee.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//         splash: Column(
//           children: [
//             Center(
//               child: LottieBuilder.asset("image/Splash.json"),
//             )
//           ],
//         ),
//         backgroundColor: Color(0xff471181),
//         splashIconSize: 400,
//         nextScreen: HelloPage());
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final token = await AuthService().getToken();
    await Future.delayed(const Duration(seconds: 2));

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HelloPage()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff491383),
      body: Center(
        child: Image.asset('assets/images/SplashLogo.png', width: 250), // صورة الشعار
      ),
    );
  }
}
