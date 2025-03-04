import 'package:flutter/material.dart';
import 'package:wsly/data/models/current_orders_model.dart';
import 'package:wsly/data/models/order_registry_model.dart';
import 'package:wsly/data/services/current_order_services.dart';
import 'package:wsly/data/services/order_registry_services.dart';

class CurrentOrderViewmodel extends ChangeNotifier {
  List<CurrentOrdersModel> _currentorders = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CurrentOrdersModel> get currentorders => _currentorders;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final CurrentOrderServices _currentOrderServices = CurrentOrderServices();

  Future<void> getCurrentOrders() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      _currentorders = await _currentOrderServices.fetchCurrentOrders();

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
