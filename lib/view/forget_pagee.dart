import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wsly/core/helper/navigations/app_navigatios.dart';
import 'package:wsly/view/login_pagee.dart';


class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
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
                image: AssetImage("assets/images/register.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 250),
                const Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(
                      fontFamily: "NotoSansArabic",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff491383)),
                ),
                SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 17),
                      hintText: "البريد الالكتروني",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "NotoSansArabic",
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: const Color(0xfff1f3ff),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white30, width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff491383), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    AppNavigation.pushAndRemove(context, LoginPage());
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff491383),
                      minimumSize: Size(330, 55)),
                  child: Text(
                    "ارسال",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
                        fontFamily: "NotoSansArabic"),
                  ),
                ),
                SizedBox(height: 30),
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
                    "رجوع",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        fontFamily: "NotoSansArabic"),
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
