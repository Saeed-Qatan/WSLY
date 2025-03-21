import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wsly/view/login_pagee.dart';
import 'package:wsly/view/register_page.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      width: 270,
                      height: 280,
                      color: Color(0xff491383),
                      child: Row(
                        children: [
                          SizedBox(width: 120),
                          Image.asset("assets/images/logo1.png", width: 130),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 130, 50, 0),
                child: Text(
                  "اهلاً وسهلاً بك في تطبيق وصل لي",
                  style: TextStyle(
                    color: Color(0xff491383),
                    fontWeight: FontWeight.w900,
                    fontSize: 45,
                    fontFamily: "NotoSansArabic",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                  vertical: 30,
                ),
                child: Text(
                  "تطبيق وصل لي موجود ليسهل لك توفير طلباتك الي تحتاجها من اي مورد وفي اقصر وقت ممكن",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                    fontFamily: "NotoSansArabic",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        ); // Go back
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xff491383),
                        minimumSize: Size(100, 55),
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
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "حساب جديد",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          fontFamily: "NotoSansArabic",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path_1 = Path();

    path_1.moveTo(0, 0);
    path_1.quadraticBezierTo(
      size.width * 1.0007400,
      size.height * -0.0035000,
      size.width,
      size.height * 0.0010600,
    );
    path_1.lineTo(size.width * 1.0016000, size.height * 1.0016000);
    path_1.quadraticBezierTo(
      size.width * 0.2129800,
      size.height * 0.8367800,
      0,
      0,
    );
    path_1.close();

    return path_1;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
