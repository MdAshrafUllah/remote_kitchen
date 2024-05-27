import 'dart:developer';

import 'package:assignment_eight/data/assignment%20three/data_model.dart';
import 'package:assignment_eight/data/assignment%20three/services/api_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var dataModel = <DataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      var result = await ApiServices.fetchData();
      if (result != null) {
        dataModel.assignAll(result);
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
