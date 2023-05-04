import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiData {
  static Future<List<dynamic>> getData(String baseurl, String finalUrl) async {
    var uri = Uri.https('pokeapi.co', '/api/v2/ability');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var results = jsonResponse['results'] as List<dynamic>;
      return results.map((result) => result['name']).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
