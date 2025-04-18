import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wsly/data/services/order_services.dart';

class OrderViewModel extends ChangeNotifier {
  File? invoiceFile;
  File? capturedImage;
  String shopName = '';  // إضافة حقل اسم المحل

  // اختيار ملف PDF
  Future<void> pickPDF() async {
    final file = await OrderService.pickPDF();
    if (file != null) {
      invoiceFile = file;
      await OrderService.saveFilePathLocally(file.path);
      notifyListeners();
    }
  }

  // التقاط صورة بالكاميرا
  Future<void> captureImage(CameraController controller) async {
    final image = await controller.takePicture();
    capturedImage = File(image.path);
    notifyListeners();
  }

  // إعادة تعيين الصورة الملتقطة
  void clearCapturedImage() {
    capturedImage = null;
    notifyListeners();
  }

  // رفع الصورة إلى السيرفر
  Future<bool> uploadImage() async {
    if (capturedImage == null) return false;
    // TODO: إضافة منطق الرفع هنا باستخدام OrderService
    return true;
  }

  // إرسال الطلب مع اسم المحل
  Future<bool> submitOrder() async {
    if (invoiceFile == null || shopName.isEmpty) return false;  // تحقق من وجود اسم المحل
    final success = await OrderService.submitOrder(shopName, invoiceFile!);  // تمرير اسم المحل مع الملف
    if (success) {
      invoiceFile = null;
      await OrderService.clearLocalPath();
      notifyListeners();
    }
    return success;
  }

  // تحميل ملف PDF المخزن محليًا
  Future<void> loadSavedFilePath() async {
    final path = await OrderService.getSavedPath();
    if (path != null) {
      invoiceFile = File(path);
      notifyListeners();
    }
  }

  // حذف ملف PDF
  Future<void> clearInvoiceFile() async {
    invoiceFile = null;
    await OrderService.clearLocalPath();
    notifyListeners();
  }

  // تعيين ملف PDF بشكل يدوي
  void setInvoiceFile(File file) {
    invoiceFile = file;
    notifyListeners();
  }

  // تعيين اسم المحل
  void setShopName(String name) {
    shopName = name;
    notifyListeners();
  }
}
