import 'package:flutter/material.dart';

Future<void> showDeleteAccountDialog(BuildContext context, VoidCallback onConfirm) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("تأكيد حذف الحساب"),
        content: Text("هل أنت متأكد أنك تريد حذف حسابك؟ لا يمكن التراجع عن هذا الإجراء."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text("إلغاء"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop(); 
              onConfirm(); 
            },
            child: Text("حذف الحساب", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
