// ignore_for_file: non_constant_identifier_name

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/data/models/order_registry_model.dart';
import 'package:wsly/viewmodels/ProfileEditViewModel.dart';
import 'package:wsly/viewmodels/order_registry_viewmodel.dart';

import '../../widgets/delivery_state.dart';
import '../../widgets/waveclipper_widget.dart';
import 'drawer.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
   late final profile;
  @override
   void initState() {
    super.initState();
    profile = Provider.of<EditProfileViewModel>(context, listen: false).profile;
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       drawer: CustomDrawer(
  profileEdit: profile,
),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WaveclipperWidget(),
            Align(alignment: Alignment.centerRight, child: text_rich_method()),
            SizedBox(height: 30),
            order_history_text(),
            SizedBox(height: 20),
            Consumer<OrderRegistryViewmodel>(
              builder: (context, viewmodel, child) {
                if (viewmodel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (viewmodel.errorMessage != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(viewmodel.errorMessage!),
                        ElevatedButton(
                          onPressed: () => viewmodel.getOrders(),
                          child: Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  );
                }

                if (viewmodel.ordersRegistry.isEmpty) {
                  return Center(child: Text('لا توجد طلبات'));
                }

                return ListView.builder(
                  itemCount: viewmodel.ordersRegistry.length,
                  itemBuilder: (context, index) {
                    return DeliveryCard(order: viewmodel.ordersRegistry[index]);
                  },
                );
              },
            ),
          ],
        ),
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
