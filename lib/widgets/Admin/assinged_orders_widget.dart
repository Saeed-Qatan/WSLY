import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/Admin/assigned_orders_model.dart';
import 'package:wsly/viewmodels/assinged_orders_viewmodel.dart';

class AssingedOrdersWidget extends StatefulWidget {
  final AssignedOrdersModel order;
  const AssingedOrdersWidget({super.key, required this.order});

  @override
  State<AssingedOrdersWidget> createState() => _AssingedOrdersWidgetState();
}

class _AssingedOrdersWidgetState extends State<AssingedOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 220,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Color(0xff4B148B),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
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
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "بقالة سالم",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "علي محمد",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    _buildButton("عرض الفاتورة", Colors.deepPurple, () {}),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("وقت الطلب : 2022/2/6 الساعة 4:30"),
                    Spacer(),
                    _buildButton("بيانات المندوب", Colors.deepPurple, () {}),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "رمز تأكيد الطلب: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              // Removes the border when the TextField is focused
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),

                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        _buildButton(" تم التوصيل", Colors.green, () {}),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(String text, Color color,Function _function) {
  return SizedBox(
    width: 120,
    height: 40,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
    ),
  );
}



class AssignedOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Consumer<AssignedOrdersViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.orders.isEmpty) {
            return Center(child: Text("لا توجد طلبات مسندة"));
          }
          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: viewModel.orders.length,
            itemBuilder: (context, index) {
              final order = viewModel.orders[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("المتجر: \${order.storeName}"),
                      Text("المندوب: \${order.agentName}"),
                      Text("وقت الطلب: \${order.orderTime}"),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => viewModel.markAsDelivered(order.id),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text("تم التوصيل", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

