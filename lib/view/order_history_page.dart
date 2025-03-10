// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/data/models/order_registry_model.dart';
import 'package:wsly/view/main-page.dart';
import 'package:wsly/widgets/delivery_state.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';
import 'package:wsly/view/drawer.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          Column(
            children: [
              WaveclipperWidget(),
              Align(
                alignment: Alignment.centerRight,
                child: text_rich_method(),
              ),
              SizedBox(height: 30),
              order_history_text(),
              SizedBox(height: 20),
              DeliveryCard(
                order: OrderRegistryModel(
                  storeName: "بقالة العمري",
                  ownerName: "عبدالله العمري",
                  deliveryTime:
                      DateTime.now().millisecondsSinceEpoch /
                      1000, // Current time in seconds
                  status: OrderStatus.inProgress,
                  imageUrl: "https://example.com/image.jpg",
                ),
              ),

              DeliveryCard(
                order: OrderRegistryModel(
                  storeName: "بقالة المطيري",
                  ownerName: "سالم حسن",
                  deliveryTime:
                      DateTime.now().millisecondsSinceEpoch /
                      1000, // Current time in seconds
                  status: OrderStatus.deliverd,
                  imageUrl: "https://example.com/image.jpg",
                ),
              ),
              DeliveryCard(
                order: OrderRegistryModel(
                  storeName: "بقالة المطيري",
                  ownerName: "سالم حسن",
                  deliveryTime:
                      DateTime.now().millisecondsSinceEpoch /
                      1000, // Current time in seconds
                  status: OrderStatus.canceled,
                  imageUrl: "https://example.com/image.jpg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column order_history_text() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          " سجل الطلبات",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff4B148B),
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(color: Colors.black, indent: 100, endIndent: 100),
      ],
    );
  }

  Text text_rich_method() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "مرحبا بك  ",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff4B148B),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: " ابو خالد  ",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff13D08C),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

Widget OrderCard(OrderRegistryModel ordert) {
  return Card(
    color: Colors.green,
    margin: EdgeInsets.all(15),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff4B148B).withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xff4B148B),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "WSLY",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Color(0xff4B148B),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "WSLY",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
