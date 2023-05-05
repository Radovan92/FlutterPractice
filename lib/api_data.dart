import 'dart:convert';
import 'package:flutter3_project/data_models/data_model/data_model.dart';
import 'package:http/http.dart' as http;

class ApiData {
  static Future<List<DataModel>> getData(
      String baseUrl, String finalUrl) async {
    var uri = Uri.https(baseUrl, finalUrl);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => DataModel.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
