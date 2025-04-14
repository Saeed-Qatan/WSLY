import 'package:flutter/material.dart';
import 'package:wsly/data/models/ForgetPasswordModel.dart';
import 'package:wsly/data/services/auth_service.dart';


class ForgetPasswordViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  bool isLoading = false;

  Future<bool> sendResetEmail() async {
    final email = emailController.text.trim();

    if (!_isValidEmail(email)) return false;

    isLoading = true;
    notifyListeners();

    final model = ForgetPasswordModel(email: email);
    final result = await AuthService().sendResetEmail(model.toJson());

    isLoading = false;
    notifyListeners();
    return result;
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(email);
  }

  void clearFields() {
    emailController.clear();
    notifyListeners();
  }
}
