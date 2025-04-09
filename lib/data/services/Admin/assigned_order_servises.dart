import 'package:http/http.dart' as http;
import 'package:wsly/core/constants/services/api_url.dart';
import 'dart:convert';
import 'package:wsly/data/models/Admin/assigned_orders_model.dart';

class AssignedOrdersService {
  Future<AssignedOrdersModel> fetchOrderDetails(int orderId, ) async {
    final url = Uri.parse('${ApiUrl.baseUrl}/$orderId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return AssignedOrdersModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load order details');
      }
    } catch (e) {
      throw Exception('Error fetching order details: $e');
    }
  }

  Future<void> markAsDelivered(int orderId) async {
    final url = Uri.parse('${ApiUrl.baseUrl}/$orderId/deliver');
    try {
      final response = await http.post(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to mark order as delivered');
      }
    } catch (e) {
      throw Exception('Error marking order as delivered: $e');
    }
  }
}
