

import 'dart:convert';

import 'package:wsly/core/constants/services/api_url.dart';
import 'package:wsly/data/models/order_registry_model.dart';
import 'package:http/http.dart' as http;

class OrderRegistryServices {
    Future <List<OrderRegistryModel>> fetchOrders() async{
      final response = await http.get(Uri.parse(ApiUrl.baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => OrderRegistryModel.fromJson(json)).toList();

      } else{
        throw Exception('Failed to load orders${response.statusCode}');
      }
      
    }

}