import 'package:get/get.dart';

class BarController extends GetxController {
  var value = 0.obs;

  void updateValue(int newValue) {
    value.value = newValue;
  }
}
