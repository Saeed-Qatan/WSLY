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
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  void _login() {
    final emailOrPhone = emailOrPhoneController.text.trim();
    final password = passwordController.text;

    if (emailOrPhone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('يرجى إدخال جميع الحقول'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // يمكنك هنا إضافة تحقق من صحة البيانات أو استدعاء API

    // إذا كانت البيانات صحيحة
    AppNavigation.pushAndRemove(context, MainPage());
  }

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

                /// حقل الجوال أو البريد الإلكتروني
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: TextField(
                    controller: emailOrPhoneController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                      hintText: "رقم الجوال أو البريد الإلكتروني",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "NotoSansArabic",
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: Color(0xfff1f3ff),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff491383), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                /// حقل كلمة المرور مع زر الإظهار
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                      hintText: "كلمة المرور",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "NotoSansArabic",
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: Color(0xfff1f3ff),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Color(0xff491383),
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff491383), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: (_) => _login(),
                  ),
                ),

                SizedBox(height: 30),

                /// زر تسجيل الدخول
                ElevatedButton(
                  onPressed: _login,
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

                // باقي الواجهة كما هي...

                SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPage()));
                    },
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
                    _buildSocialButton(FontAwesomeIcons.apple),
                    SizedBox(width: 10),
                    _buildSocialButton(FontAwesomeIcons.facebook),
                    SizedBox(width: 10),
                    _buildSocialButton(FontAwesomeIcons.google),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return ElevatedButton(
      onPressed: () {
        // تعامل مع تسجيل الدخول الاجتماعي هنا
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xff491383),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      ),
      child: FaIcon(icon, color: Colors.white, size: 20),
    );
  }
}
