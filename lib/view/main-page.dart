import 'package:flutter/material.dart';
import 'package:wsly/view/order_history_page.dart';
import 'package:wsly/view/order_page.dart';
import 'package:wsly/view/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int _selectedIdex = 0;

class _MainPageState extends State<MainPage> {
  static List<Widget> _screens = <Widget>[
    OrderHistoryPage(),
    OrderPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          body: Center(child: _screens[_selectedIdex]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _selectedIdex = value;
              });
            },

            currentIndex: _selectedIdex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.history_edu_sharp),
                label: "السجل",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "الطلبات",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "بياناتي",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
