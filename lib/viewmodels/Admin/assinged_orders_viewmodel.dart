import 'package:flutter/material.dart';
import 'package:wsly/data/models/Admin/assigned_orders_model.dart';
import 'package:wsly/data/services/Admin/assigned_order_servises.dart';

class AssignedOrdersViewModel extends ChangeNotifier {
  List<AssignedOrdersModel> _orders = [];
  bool _isLoading = false;
  final AssignedOrdersService _service = AssignedOrdersService();

  List<AssignedOrdersModel> get orders => _orders;
  bool get isLoading => _isLoading;

  get errorMessage => null;

  Future<void> fetchAssignedOrders() async {
    _isLoading = true;
    notifyListeners();
    try {
      _orders = ( _service.fetchOrderDetails) as List<AssignedOrdersModel>;
    } catch (e) {
      debugPrint('Error fetching assigned orders: \$e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markAsDelivered(int orderId) async {
    try {
      await _service.markAsDelivered(orderId);
      _orders =
          _orders.map((order) {
            if (order.id == orderId) {
              return order.copyWith(isDelivered: true);
            }
            return order;
          }).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error marking order as delivered: \$e');
    }
  }
}
