import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsly/data/services/auth_service.dart';

class LogoutViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا يوجد توكن محفوظ'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    bool result = await _authService.logout(token);

    if (result) {
      await prefs.remove('access_token');
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('فشل تسجيل الخروج')));
    }
  }
}
