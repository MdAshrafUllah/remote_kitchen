import 'package:assignment_eight/controller/assignment%20two/count_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentTwoHomeScreen extends StatelessWidget {
  AssignmentTwoHomeScreen({super.key});

  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Two"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(() {
            return Text(
              countController.count.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                countController.resetNumber();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                "Reset",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countController.addNumber();
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
