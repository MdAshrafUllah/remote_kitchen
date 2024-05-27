import 'dart:convert';

import 'package:assignment_eight/data/assignment%20five/api.dart';
import 'package:assignment_eight/data/assignment%20five/model/model.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  static Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=${Api.apiKey}&q=$city&aqi=yes"));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
