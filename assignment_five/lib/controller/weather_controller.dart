import 'dart:developer';

import 'package:get/get.dart';
import 'package:assignment_five/data/model/model.dart';
import 'package:assignment_five/data/services/network_caller.dart';

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
