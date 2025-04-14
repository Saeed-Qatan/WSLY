import 'package:flutter/material.dart';
import 'package:wsly/data/models/UserRegisterModel.dart';
import 'package:wsly/data/models/login_model.dart';
import 'package:wsly/data/services/auth_service.dart';


class RegisterViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  get formKey => null;

  Future<bool> register() async {
    if (passwordController.text != confirmPasswordController.text) return false;

    isLoading = true;
    notifyListeners();

    final user = UserModel(
      username: usernameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      password: passwordController.text.trim(),  
    );

    final success = await _authService.register(user);

    isLoading = false;
    notifyListeners();

    if (success) clearFields();
    return success;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void clearFields() {
    usernameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
