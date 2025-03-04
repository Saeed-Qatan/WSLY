import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/data/models/current_orders_model.dart';
import 'package:wsly/viewmodels/current_order_viewmodel.dart';

class CurrentOrders extends StatefulWidget {
  final CurrentOrdersModel currentOrder;
  
   CurrentOrders({super.key, required this.currentOrder, });

  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  
       
    
  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                        widget.currentOrder.storeName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.currentOrder.ownerName,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Spacer(),
                  _buildButton("عرض الفاتورة", Colors.deepPurple),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("وقت الطلب : 2022/2/6 الساعة 4:30"),
                  Spacer(),
                  _buildButton("بيانات المندوب", Colors.deepPurple),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "رمز تأكيد الطلب: ${widget.currentOrder.order_code}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "هذا الرمز يسلم للمندوب \nعند اكتمال عملية التوصيل",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  _buildButton("حالة الطلب", Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(String text, Color color) {
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

class currentOrdersList extends StatefulWidget {
  @override
  currentOrdersListState createState() => currentOrdersListState();
}

class currentOrdersListState extends State<currentOrdersList> {
  @override
  void initState() {
    super.initState();
    // Fetch orders when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CurrentOrderViewmodel>().getCurrentOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentOrderViewmodel>(
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
                  onPressed: () => viewmodel.getCurrentOrders(),
                  child: Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        }

        if (viewmodel.currentorders.isEmpty) {
          return Center(child: Text('لا توجد طلبات'));
        }

        return ListView.builder(
          itemCount: viewmodel.currentorders.length,
          itemBuilder: (context, index) {
            return CurrentOrders(currentOrder: viewmodel.currentorders[index]);
          },
        );
      },
    );
  }
}
