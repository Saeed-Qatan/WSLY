import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wsly/core/helper/navigations/app_navigatios.dart';
import 'package:wsly/view/forget_pagee.dart';
import 'package:wsly/view/main-page.dart';
import 'package:wsly/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 60),
                Image.asset("assets/images/logo1.png", width: 120),
                SizedBox(height: 40),
                Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    color: Color(0xff491383),
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    fontFamily: "NotoSansArabic",
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 17,
                      ),
                      hintText: "رقم الجوال او البريد الالكتروني",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "NotoSansArabic",
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: Color(0xfff1f3ff),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30, width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff491383),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 17,
                      ),
                      hintText: "كلمة المرور",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "NotoSansArabic",
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: Color(0xfff1f3ff),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30, width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff491383),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    AppNavigation.pushAndRemove(context, MainPage());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xff491383),
                    minimumSize: Size(330, 55),
                  ),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                      fontFamily: "NotoSansArabic",
                    ),
                  ),
                ),
                SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size(0, 0),
                  ),
                  child: Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      fontFamily: "NotoSansArabic",
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove padding

                      minimumSize: Size(0, 0),
                    ),
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(
                        color: Color(0xff491383),
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        fontFamily: "NotoSansArabic",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  "او يمكنك تسجيل الدخول بـ",
                  style: TextStyle(
                    color: Color(0xff491383),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    fontFamily: "NotoSansArabic",
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xff491383),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xff491383),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xff491383),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
