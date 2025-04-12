import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/main.dart';
import 'package:wsly/view/camera_page.dart';
import 'package:wsly/viewmodels/camera_view_model.dart';
import 'package:wsly/viewmodels/upload_view_model.dart';
import 'drawer.dart';
import '../../widgets/waveclipper_widget.dart';

class OrderPage extends StatefulWidget {
  List<CameraDescription> cameras = [];

  OrderPage(this.cameras, {super.key});

  @override
  State<OrderPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        profileEdit: ProfileEdit(
          name: 'علي ناصر',
          email: 'Alinasser@gmail.com',
          address: '123 Main St',
          number: '774165326',
          car_Plate: 'ABC/123',
          password: '123456',
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WaveclipperWidget(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "مرحبا بك  ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff4B148B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " ابو خالد  ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff13D08C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(
                  "اطلب يوصل لك",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff4B148B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: Colors.black, indent: 100, endIndent: 100),
                SizedBox(height: 20),
                Image.asset(
                  "assets/images/download (6).png",
                  fit: BoxFit.scaleDown,

                  alignment: Alignment.topCenter,
                  width: 90,
                ),
                SizedBox(height: 10),
                Text(
                  "تحتاج الى رفع صورة الفاتورة",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff4B148B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("فتح الكاميرا"),
                            content: Text("هل تريد فتح الكاميرا؟"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("إلغاء"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); // أغلق الـ dialog أولًا
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ChangeNotifierProvider(
                                            create: (_) => CameraViewModel(),
                                            child: CameraPage(cameras: cameras),
                                          ),
                                    ),
                                  );
                                },
                                child: Text("فتح"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4B148B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 25),
                        Text(
                          "فتح الكاميرا",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    IconButton(
                      icon: Icon(Icons.upload_file, color: Colors.black),
                     onPressed: () {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("رفع فاتورة PDF"),
        content: Text("هل تريد اختيار فاتورة PDF من جهازك؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("إلغاء"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );

              if (result != null) {
                final file = File(result.files.single.path!);
                Provider.of<UploadViewModel>(context, listen: false).setFile(file);
              }
            },
            child: Text("اختيار"),
          ),
        ],
      );
    },
  );
},

                    ),
                    SizedBox(width: 20),
                    Text(
                      "اختر الفاتورة من الملفات",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4B148B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "تقديم الطلب",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
