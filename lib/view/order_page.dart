import 'package:flutter/material.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [WaveclipperWidget()]));
  }
}