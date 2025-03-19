import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/data/services/auth_service.dart';
import 'package:wsly/view/logout_page.dart';
import 'package:wsly/viewmodels/delete_account_view_model.dart';
import 'package:wsly/viewmodels/logout_viewmodel.dart';
import 'package:wsly/widgets/delete_dialog_widget.dart';
import 'package:wsly/widgets/logout_dialog_widget.dart';
import 'Editprofile.dart';
import 'main-page.dart';
import 'order_page.dart';

class CustomDrawer extends StatefulWidget {
  final ProfileEdit profileEdit;

  const CustomDrawer({super.key, required this.profileEdit});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff4B148B)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 37,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Color(0xff4B148B)),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.profileEdit.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "times",
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "مرحبا بك",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.profileEdit.number,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.profileEdit.email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit_note_outlined),
            title: Text(
              "تعديل الملف الشخصي",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            //الانتقال الى صفحة تعديل الملف
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text(
              "الشروط والاحكام",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text(
              " الشكاوي والاقتراحات ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "تسجيل الخروج",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              showLogoutDialog(context, () async {
                await LogoutViewModel(
                  context.read<AuthService>(),
                ).logout(context);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text(
              "حذف الحساب",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              showDeleteAccountDialog(context, () async {
                await DeleteAccountViewModel(context.read<AuthService>(),0).deleteAccount(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
