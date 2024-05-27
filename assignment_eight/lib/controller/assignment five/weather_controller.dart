import 'dart:developer';

import 'package:assignment_eight/data/assignment%20five/model/model.dart';
import 'package:assignment_eight/data/assignment%20five/services/network_caller.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var weather = WeatherModel().obs;

  void fetchWeather(String city) async {
    try {
      var fetchedWeather = await NetworkCaller.getWeather(city);
      weather.value = fetchedWeather;
    } catch (e) {
      log("Error fetching weather: $e");
    }
  }
}
