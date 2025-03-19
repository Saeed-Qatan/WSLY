import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'package:wsly/data/models/current_orders_model.dart';
import 'drawer.dart';
import 'package:wsly/viewmodels/current_order_viewmodel.dart';
import '../../widgets/current_orders.dart';
import '../../widgets/waveclipper_widget.dart';

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
            Align(alignment: Alignment.centerRight, child: textRichMethod()),
            SizedBox(height: 30),
            currentOrderHeader(),
            SizedBox(height: 20),
            Consumer<CurrentOrderViewmodel>(
              builder: (context, orderViewModel, child) {
                if (orderViewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (orderViewModel.errorMessage != null) {
                  return Center(child: Text(orderViewModel.errorMessage!));
                }

                if (orderViewModel.currentorders.isEmpty) {
                  return Center(child: Text("لا توجد طلبات حالية"));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderViewModel.currentorders.length,
                  itemBuilder: (context, index) {
                    return CurrentOrders(
                      currentOrder: orderViewModel.currentorders[index],
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

  Column currentOrderHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "الطلبات الجارية",
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

  Text textRichMethod() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "مرحبا بك ",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff4B148B),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "أبو خالد",
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
