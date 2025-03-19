import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/viewmodels/delete_account_view_model.dart';
import 'package:wsly/widgets/delete_dialog_widget.dart';

class DeleteAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deleteAccountViewModel = Provider.of<DeleteAccountViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("حذف الحساب")),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            showDeleteAccountDialog(context, () async {
              await deleteAccountViewModel.deleteAccount(context);
            });
          },
          child: Text("حذف الحساب", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
