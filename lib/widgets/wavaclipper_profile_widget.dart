import 'dart:math';
import 'package:flutter/material.dart';

class WaveclipperProfileWidget extends StatefulWidget {
  const WaveclipperProfileWidget({super.key});

  @override
  State<WaveclipperProfileWidget> createState() => _WaveclipperWidgetState();
}

class _WaveclipperWidgetState extends State<WaveclipperProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Waveclipper(),
          child: Container(
            height:
                MediaQuery.of(context).size.height * 0.25, // نسبة لتكون متجاوبة
            color: Color(0xff4B148B),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 100),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Image.asset(
                          "assets/images/logo1.png",
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Waveclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
