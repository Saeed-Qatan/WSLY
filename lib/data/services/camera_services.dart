import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:wsly/core/constants/services/api_url.dart';

Future<void> sendImageToServer(BuildContext context, File imageFile) async {
  final uri = Uri.parse("${ApiUrl.baseUrl}/orders"); // <-- عدّل هذا بالرابط الصحيح

  final request = http.MultipartRequest('POST', uri);

  request.files.add(
    await http.MultipartFile.fromPath(
      'image', // اسم البارامتر اللي يستقبله السيرفر
      imageFile.path,
      filename: path.basename(imageFile.path),
    ),
  );

  try {
    final response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ تم إرسال الصورة بنجاح")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ فشل في الإرسال: ${response.statusCode}")),
      );
    }
  } catch (e) {
    print("خطأ في إرسال الصورة: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("❌ حدث خطأ أثناء الإرسال")),
    );
  }
}
