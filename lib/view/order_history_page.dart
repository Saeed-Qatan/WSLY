import 'package:flutter/material.dart'
    show AppBar, Container, Scaffold, State, StatefulWidget, Widget;
import 'package:flutter/widgets.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [WaveclipperWidget()]));
  }
}
