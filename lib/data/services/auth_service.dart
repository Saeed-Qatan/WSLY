import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsly/core/constants/Networks/api_url.dart';

class AuthService {
  Future<void> login(String email, String password) async {
    final url = Uri.parse("${ApiUrl.baseUrl}/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userId = data["user_id"]; // الحصول على userId من الاستجابة

      // تخزين userId في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt("user_id", userId);
    } else {
      throw Exception("فشل تسجيل الدخول");
    }
  }

  // دالة لاسترجاع userId من SharedPreferences
  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user_id");
  }
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // مسح بيانات المستخدم المخزنة محليًا
  }

  Future<void> deleteAccount(int userId) async {
    final url = Uri.parse("${ApiUrl.baseUrl}/delete-account");

    final response = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"user_id": userId}),
    );

    if (response.statusCode == 200) {
      print("تم حذف الحساب بنجاح");
    } else {
      throw Exception("فشل حذف الحساب");
    }
  }
}
