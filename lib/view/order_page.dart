import 'dart:io';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/main.dart';
import 'package:wsly/view/camera_page.dart';
import 'package:wsly/viewmodels/order_view_model.dart';
import 'drawer.dart';
import '../../widgets/waveclipper_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
   final TextEditingController _shopNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<OrderViewModel>(context, listen: false).loadSavedFilePath();
  }

  @override
  Widget build(BuildContext context) {
    final orderVM = Provider.of<OrderViewModel>(context);

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
                  width: 90,
                ),
                SizedBox(height: 10),
                Text(
                  "أدخل اسم المحل",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextField(
                    controller: _shopNameController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "اسم المحل",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "تحتاج الى رفع صورة أو فاتورة PDF",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff4B148B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // عرض اسم الملف
                if (orderVM.invoiceFile != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "تم اختيار الملف: ${orderVM.invoiceFile!.path.split('/').last}",
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ),

                // زر فتح الكاميرا
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("فتح الكاميرا"),
                          content: Text("هل تريد فتح الكاميرا؟"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("إلغاء"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CameraPage(cameras: cameras),
                                  ),
                                );
                              },
                              child: Text("فتح"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
                    label: Text("فتح الكاميرا", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4B148B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // اختيار ملف PDF
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.upload_file, color: Colors.black),
                      onPressed: () async {
                        await orderVM.pickPDF();
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      "اختر فاتورة PDF",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // زر إرسال الطلب
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () async {
                      final success = await orderVM.submitOrder();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(success ? 'تم إرسال الطلب بنجاح' : 'فشل في إرسال الطلب'),
                          backgroundColor: success ? Colors.green : Colors.red,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4B148B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("تقديم الطلب", style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
