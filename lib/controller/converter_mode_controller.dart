import 'package:get/get.dart';
import 'package:task/screen/singleConvert_Screen.dart';

class ConverterModeController extends GetxController {
  var mode = 1.obs;

  void setMode(int val) {
    mode.value = val;
  }

  void onGetStart() {
    Get.to(() => const SingleconvertScreen());
  }
}
