import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/viewmodels/order_registry_viewmodel.dart';
import 'package:wsly/data/models/order_registry_model.dart';

class DeliveryCard extends StatefulWidget {
  final OrderRegistryModel order;

  const DeliveryCard({Key? key, required this.order}) : super(key: key);

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.order.storeName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.order.ownerName,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "وقت التوصيل: ${widget.order.deliveryTime}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getStatusColor(widget.order.status),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _getStatusText(widget.order.status),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.deliverd:
        return Colors.green;
      case OrderStatus.inProgress:
        return Colors.orange;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }

  String _getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.deliverd:
        return "تم التوصيل";
      case OrderStatus.inProgress:
        return "جاري التوصيل";
      case OrderStatus.canceled:
        return "تم الإلغاء";
    }
  }
}

class DeliveryList extends StatefulWidget {
  @override
  _DeliveryListState createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  @override
  void initState() {
    super.initState();
    // Fetch orders when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderRegistryViewmodel>().getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderRegistryViewmodel>(
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
    );
  }
}
