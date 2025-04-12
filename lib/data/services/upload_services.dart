import 'dart:io';
import 'package:http/http.dart' as http;

class UploadService {
  Future<bool> uploadPdfFile(File file) async {
    var uri = Uri.parse("https://yourapi.com/upload");

    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    var response = await request.send();

    return response.statusCode == 200;
  }
}
