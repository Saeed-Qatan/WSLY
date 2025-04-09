import 'package:flutter/material.dart';

Future<void> showLogoutDialog(BuildContext context, VoidCallback onConfirm) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("تأكيد تسجيل الخروج"),
        content: Text("هل أنت متأكد أنك تريد تسجيل الخروج؟"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); 
              onConfirm(); 
            },
            child: Text("تسجيل الخروج"),
          ),
        ],
      );
    },
  );
}
