import 'package:flutter/material.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/data/models/current_orders_model.dart';
import 'package:wsly/view/drawer.dart';
import 'package:wsly/viewmodels/current_order_viewmodel.dart';
import 'package:wsly/widgets/current_orders.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            WaveclipperWidget(),
            Align(alignment: Alignment.centerRight, child: text_rich_method()),
            SizedBox(height: 30),
            CurrentOrder(),
            SizedBox(height: 20),
            CurrentOrders(
              currentOrder: CurrentOrdersModel(
                storeName: "متجر 1",
                ownerName: "المالك 1",
                deliveryTime: DateTime.now().millisecondsSinceEpoch / 1000,
                order_code: 1234,
                imageUrl: "https://example.com/image1.jpg",
              ),
            ),
            CurrentOrders(
              currentOrder: CurrentOrdersModel(
                storeName: "متجر 2",
                ownerName: "المالك 2",
                deliveryTime: DateTime.now().millisecondsSinceEpoch / 1000,
                order_code: 5678,
                imageUrl: "https://example.com/image2.jpg",
              ),
            ),
            CurrentOrders(
              currentOrder: CurrentOrdersModel(
                storeName: "متجر 3",
                ownerName: "المالك 3",
                deliveryTime: DateTime.now().millisecondsSinceEpoch / 1000,
                order_code: 9101,
                imageUrl: "https://example.com/image3.jpg",
              ),
            ),
            CurrentOrders(
              currentOrder: CurrentOrdersModel(
                storeName: "متجر 4",
                ownerName: "المالك 4",
                deliveryTime: DateTime.now().millisecondsSinceEpoch / 1000,
                order_code: 1121,
                imageUrl: "https://example.com/image4.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column CurrentOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          " الطلبات الجارية ",
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
