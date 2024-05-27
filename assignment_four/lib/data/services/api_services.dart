import 'dart:convert';

import 'package:assignment_four/data/data_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<DataModel>?> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((e) => DataModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
