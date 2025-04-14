import 'package:flutter/material.dart';
import 'package:wsly/data/models/login_model.dart';
import 'package:wsly/data/services/auth_service.dart';


class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  Future<bool> login() async {
    isLoading = true;
    notifyListeners();

    final user = LoginModel(
      emailOrPhone: emailOrPhoneController.text.trim(),
      password: passwordController.text,
    );

    final success = await _authService.login(user);

    isLoading = false;
    notifyListeners();

    return success;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
