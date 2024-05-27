import 'dart:convert';
import 'dart:developer';

import 'package:assignment_eight/data/assignment%20four/data_model.dart';
import 'package:assignment_eight/data/assignment%20four/services/api_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignmentFourHomeController extends GetxController {
  var isLoading = false.obs;
  var dataModel = <DataModel>[].obs;
  SharedPreferences? prefs;

  @override
  void onInit() {
    super.onInit();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await ApiServices.fetchData();
      if (result != null) {
        dataModel.assignAll(result);
        saveDataToPreferences(result);
      } else {
        loadDataFromPreferences();
      }
    } catch (e) {
      log("Error: $e");
      loadDataFromPreferences();
    } finally {
      isLoading.value = false;
    }
  }

  void saveDataToPreferences(List<DataModel> data) async {
    final jsonString = jsonEncode(data.map((item) => item.toJson()).toList());
    await prefs?.setString('dataModel', jsonString);
  }

  void loadDataFromPreferences() {
    final jsonString = prefs?.getString('dataModel');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<DataModel> dataList =
          jsonList.map((item) => DataModel.fromJson(item)).toList();
      dataModel.assignAll(dataList);
    }
  }
}
