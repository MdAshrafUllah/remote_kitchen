import 'package:assignment_eight/controller/assignment%20three/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentThreeHomeScreen extends StatelessWidget {
  AssignmentThreeHomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Assignment Three"),
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
