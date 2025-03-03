import 'package:flutter/material.dart';
import 'package:wsly/data/models/order_registry_model.dart';
import 'package:wsly/data/services/order_registry_services.dart';

class OrderRegistryViewmodel extends ChangeNotifier {
  List<OrderRegistryModel> _ordersRegistry = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<OrderRegistryModel> get ordersRegistry => _ordersRegistry;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final OrderRegistryServices _orderRegistryServices = OrderRegistryServices();

  Future<void> getOrders() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      _ordersRegistry = await _orderRegistryServices.fetchOrders();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
