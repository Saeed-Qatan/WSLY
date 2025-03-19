import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/viewmodels/logout_viewmodel.dart';
import 'package:wsly/widgets/logout_dialog_widget.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logoutViewModel = Provider.of<LogoutViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الخروج")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showLogoutDialog(context, () async {
              await logoutViewModel.logout(context);
            });
          },
          child: Text("تسجيل الخروج"),
        ),
      ),
    );
  }
}
