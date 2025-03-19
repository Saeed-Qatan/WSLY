import 'package:flutter/material.dart';
import 'package:wsly/data/services/auth_service.dart';

class DeleteAccountViewModel extends ChangeNotifier {
  final AuthService _authService;
  final int userId;

  DeleteAccountViewModel(this._authService, this.userId);

  Future<void> deleteAccount(BuildContext context) async {
    if (userId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل تحديد هوية المستخدم")),
      );
      return;
    }

    try {
      await _authService.deleteAccount(userId); // إرسال طلب الحذف
      Navigator.pushReplacementNamed(context, '/login'); // إعادة التوجيه
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل حذف الحساب")),
      );
    }
  }
}
