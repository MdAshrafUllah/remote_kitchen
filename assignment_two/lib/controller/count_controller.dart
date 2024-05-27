import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt count = 0.obs;

  void addNumber() {
    count.value++;
  }

  void resetNumber() {
    count.value = 0;
  }
}
