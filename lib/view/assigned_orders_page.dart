import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/assigned_orders_model.dart';
import 'package:wsly/viewmodels/assinged_orders_viewmodel.dart';
import 'package:wsly/widgets/assinged_orders_widget.dart';
import 'package:wsly/widgets/waveclipper_widget.dart';

class AssignedOrdersPage extends StatefulWidget {
  const AssignedOrdersPage({super.key});

  @override
  State<AssignedOrdersPage> createState() => _AssignedOrdersPageState();
}

class _AssignedOrdersPageState extends State<AssignedOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WaveclipperWidget(),
            Align(alignment: Alignment.centerRight, child: text_rich_method()),
            SizedBox(height: 30),
            order_history_text(),
            SizedBox(height: 20),
            Consumer<AssignedOrdersViewModel>(
              builder: (context, orderViewModel, child) {
                if (orderViewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (orderViewModel.errorMessage != null) {
                  return Center(child: Text(orderViewModel.errorMessage!));
                }

                if (orderViewModel.orders.isEmpty) {
                  //return Center(child: Text("لا توجد طلبات مستندة"));
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderViewModel.orders.length,
                    itemBuilder: (context, index) {
                      return AssingedOrdersWidget(
                        order: AssignedOrdersModel(
                          id: 1,
                          storeName: "saeed store",
                          ownerName: "saeed",
                          deliveryTime: DateTime.now(),
                          orderCode: "123",
                          imageUrl: "https://example.com/image.jpg",
                          isDelivered: true,
                        ),
                      );
                    },
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderViewModel.orders.length,
                  itemBuilder: (context, index) {
                    return AssingedOrdersWidget(
                      order: AssignedOrdersModel(
                        id: 1,
                        storeName: "saeed store",
                        ownerName: "saeed",
                        deliveryTime: DateTime.now(),
                        orderCode: "123",
                        imageUrl: "https://example.com/image.jpg",
                        isDelivered: true,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
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
