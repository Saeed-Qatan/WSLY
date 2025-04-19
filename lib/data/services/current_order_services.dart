import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wsly/core/constants/services/api_url.dart';
import 'package:wsly/data/models/current_orders_model.dart';

class CurrentOrderServices {
  Future<List<CurrentOrdersModel>> fetchCurrentOrders() async {
    final response = await http.get(Uri.parse("${ApiUrl.baseUrl}/customers/me/orders"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CurrentOrdersModel.fromJson(json)).toList();
    }else{
        throw Exception(' خطاء في تحميل الطلبات الجارية ${response.statusCode}');
      }
  }
}
