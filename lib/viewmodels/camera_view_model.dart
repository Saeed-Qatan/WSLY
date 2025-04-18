import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class CameraViewModel extends ChangeNotifier {
  bool _isSending = false;
  bool get isSending => _isSending;

  String? _message;
  String? get message => _message;

  Future<void> sendImageToServer(File imageFile) async {
    _isSending = true;
    notifyListeners();

    final uri = Uri.parse("https://your-api-endpoint.com/upload");

    final request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        filename: path.basename(imageFile.path),
      ),
    );

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        _message = "✅ تم إرسال الصورة بنجاح";
      } else {
        _message = "❌ فشل في الإرسال: ${response.statusCode}";
      }
    } catch (e) {
      _message = "❌ حدث خطأ أثناء الإرسال: $e";
    }

    _isSending = false;
    notifyListeners();
  }

  void clearMessage() {
    _message = null;
    notifyListeners();
  }
}