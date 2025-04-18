import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsly/core/constants/services/api_url.dart';
import 'package:wsly/data/models/UserRegisterModel.dart';
import 'package:wsly/data/models/login_model.dart';

class AuthService {
  Future<bool> login(LoginModel user) async {
    final url = Uri.parse('${ApiUrl.baseUrl}/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];

      // حفظ التوكن في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      return true;
    } else {
      return false;
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

 Future<bool> logout(String token) async {
    final url = Uri.parse("${ApiUrl.baseUrl}/api/logout");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("فشل تسجيل الخروج: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print("خطأ أثناء الاتصال بالخادم: $e");
      return false;
    }
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
  
   Future<bool> register(UserModel user) async {
    final url = Uri.parse("${ApiUrl.baseUrl}/register");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Register failed: ${response.body}");
      return false;
    }
  }


  Future<bool> sendResetEmail(Map<String, dynamic> data) async {
    final url = Uri.parse("${ApiUrl.baseUrl}/forgot");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    return response.statusCode == 200;
  }
}



 