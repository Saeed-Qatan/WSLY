import 'package:http/http.dart' as http;
import 'package:wsly/core/constants/services/api_url.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';
import 'dart:convert';


class EditProfileService {
  Future<bool> updateProfile(ProfileEdit profileEdit) async {
    final url = Uri.parse("${ApiUrl.baseUrl}/customers/me/profile"); // عدّل الرابط حسب API الفعلي
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(profileEdit.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('فشل التحديث: ${response.body}');
        return false;
      }
    } catch (e) {
      print('خطأ أثناء التحديث: $e');
      return false;
    }
  }
}
