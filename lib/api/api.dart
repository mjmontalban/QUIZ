// ignore_for_file: unnecessary_this

import 'package:http/http.dart' as http;

class Api {
  static String apiBaseUrl() {
    return "http://192.168.1.15:88/evsu/";
  }

  static Future login( userId ) async {
    var url = Uri.parse(apiBaseUrl() + "login.php");
    var response = await http.post(url, body: {'userId': userId });
    return response.body;
  }
}