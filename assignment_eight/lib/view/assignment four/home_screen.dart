import 'package:assignment_eight/controller/assignment%20four/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentFourHomeScreen extends StatelessWidget {
  AssignmentFourHomeScreen({super.key});

  final AssignmentFourHomeController homeController =
      Get.put(AssignmentFourHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Assignment Four"),
        ),
        body: Obx(
          () => homeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                  ),
                  itemCount: homeController.dataModel.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        homeController.dataModel[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        homeController.dataModel[index].body,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
        ));
  }
}
