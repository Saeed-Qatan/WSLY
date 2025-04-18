// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/main.dart';

import 'current_orders_page.dart';
import 'drawer.dart';
import 'order_history_page.dart';
import 'order_page.dart';

class MainPage extends StatefulWidget {
  var cameras;
   MainPage({
    Key? key,
    this.cameras,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

int _selectedIndex = 0;

class _MainPageState extends State<MainPage> {
  static final List<Widget> _screens = <Widget>[
    OrderHistoryPage(),
    OrderPage(),
   CurrentOrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(
            profileEdit: ProfileEdit(
              name: 'علي ناصر',
              email: 'Alinasser@gmail.com',
              address: '123 Main St',
              number: '774165326',
              car_Plate: 'ABC/123',
              password: '123456',
            ),
          ),

          body: Center(child: _screens[_selectedIndex]),

          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Color(0xff7042A4),
            color: Color(0xff4B148B),
            animationDuration: const Duration(milliseconds: 300),
            items: const <Widget>[
              Icon(
                Icons.history,
                size: 26,
                color: Colors.white,
                semanticLabel: "History",
              ),
              Icon(Icons.shopping_cart, size: 26, color: Colors.white),
              Icon(Icons.list_alt, size: 26, color: Colors.white),
            ],

            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
