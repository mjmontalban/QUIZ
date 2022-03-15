// ignore_for_file: unnecessary_this

import 'package:evsu_student/global/global.dart';
import 'package:http/http.dart' as http;

class Api {
  static String apiBaseUrl() {
    return "$apiUrl/";
  }

  static Future login( userId ) async {
    var url = Uri.parse(apiBaseUrl() + "login.php");
    var response = await http.post(url, body: {'userId': userId });
    return response.body;
  }
}