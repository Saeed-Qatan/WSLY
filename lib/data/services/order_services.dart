// lib/services/order_service.dart
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  // اختيار ملف PDF
  static Future<File?> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    return result != null ? File(result.files.single.path!) : null;
  }

  // التقاط صورة بالكاميرا وحفظها مؤقتاً
  static Future<File?> takePicture(CameraController controller) async {
    if (!controller.value.isInitialized) return null;
    final XFile image = await controller.takePicture();
    return File(image.path);
  }

  // رفع الطلب إلى السيرفر مع إضافة اسم المحل
  static Future<bool> submitOrder(String shopName, File file) async {
    final url = Uri.parse('https://example.com/submitOrder');

    var request = http.MultipartRequest('POST', url)
      ..fields['shop_name'] = shopName // إرسال اسم المحل
      ..files.add(await http.MultipartFile.fromPath('invoice', file.path));

    var response = await request.send();
    return response.statusCode == 200;
  }

  // حفظ المسار محلياً
  static Future<void> saveFilePathLocally(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_invoice_path', path);
  }

  // مسح المسار المحلي
  static Future<void> clearLocalPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_invoice_path');
  }

  // استرجاع المسار المحلي
  static Future<String?> getSavedPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('saved_invoice_path');
  }
}
