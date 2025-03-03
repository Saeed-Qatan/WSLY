import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:wsly/widgets/delivery_state.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          WaveclipperWidget(),
          Align(alignment: Alignment.centerRight, child: text_rich_method()),
          SizedBox(height: 30),
          order_history_text(),
          SizedBox(height: 20),
          DeliveryCard(),
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
