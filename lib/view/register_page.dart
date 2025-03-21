import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wsly/core/helper/navigations/app_navigatios.dart';
import 'package:wsly/view/login_pagee.dart';
import 'package:wsly/view/main-page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget Text_field(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 17,
          ),
          hintText: title,
          hintStyle: TextStyle(
            color: Colors.grey[600],
            fontFamily: "NotoSansArabic",
            fontWeight: FontWeight.w500,
          ),
          fillColor: const Color(0xfff1f3ff),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white30, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff491383), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
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
                image: AssetImage("image/register.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Text(
                  "انشاء حساب جديد",
                  style: TextStyle(
                    fontFamily: "NotoSansArabic",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff491383),
                  ),
                ),
                SizedBox(height: 10),
                Text_field("اسم المستخدم"),
                Text_field("رقم الجوال"),
                Text_field("البريد الالكتروني"),
                Text_field("العنوان"),
                Text_field("كلمة المرور"),
                Text_field("تأكيد كلمة المرور"),
                SizedBox(height: 10),
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
                    "تسجيل",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                      fontFamily: "NotoSansArabic",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size(0, 0),
                  ),
                  child: Text(
                    "لدي حساب في وصل لي مسبقاً",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      fontFamily: "NotoSansArabic",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
