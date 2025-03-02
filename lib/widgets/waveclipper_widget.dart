import 'package:flutter/material.dart';

class WaveclipperWidget extends StatefulWidget {
  const WaveclipperWidget({super.key});

  @override
  State<WaveclipperWidget> createState() => _WaveclipperWidgetState();
}

class _WaveclipperWidgetState extends State<WaveclipperWidget> {
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
                  Text(
                    "WSLY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "شركة وصل لي",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "للخدمات اللوجيستية",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          height: MediaQuery.of(context).size.height * 0.24,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
            color: Color(0xff7042A4).withOpacity(0.6),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
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
