import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wsly/data/services/upload_services.dart';

class UploadViewModel extends ChangeNotifier {
  final UploadService _uploadService = UploadService();

  File? selectedFile;
  String? fileName;
  bool isLoading = false;
  String statusMessage = '';

  void setFile(File file) {
    selectedFile = file;
    fileName = file.path.split('/').last;
    notifyListeners();
  }

  Future<void> uploadFile() async {
    if (selectedFile == null) {
      statusMessage = 'لم يتم اختيار ملف';
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      bool result = await _uploadService.uploadPdfFile(selectedFile!);
      statusMessage = result ? 'تم رفع الملف بنجاح' : 'فشل في رفع الملف';
    } catch (e) {
      statusMessage = 'حدث خطأ أثناء الرفع: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  void clearFile() {
    selectedFile = null;
    fileName = null;
    statusMessage = '';
    notifyListeners();
  }
}
