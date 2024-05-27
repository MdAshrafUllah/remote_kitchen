import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:assignment_five/controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Five'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _search,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter City Name",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        weatherController.fetchWeather(_search.text);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              const ContinuousRectangleBorder())),
                      child: const Text("Search"),
                    ),
                  )
                ],
              ),
            ),
            Obx(() {
              if (weatherController.weather.value.current == null ||
                  weatherController.weather.value.current!.condition == null) {
                return const SizedBox();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Image.network(
                      "https:${weatherController.weather.value.current!.condition!.icon ?? ""}",
                    ),
                    Text(
                      '${weatherController.weather.value.current!.tempC!.toStringAsFixed(0)}°C',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${weatherController.weather.value.current!.condition!.text}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }
}
