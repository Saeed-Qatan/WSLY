import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wsly/view/first_page.dart';

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
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HelloPage()), // انتقل إلى الشاشة الرئيسية
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff491383),
      body: Center(
        child: Image.asset('image/SplashLogo.png', width: 250), // صورة الشعار
      ),
    );
  }
}
