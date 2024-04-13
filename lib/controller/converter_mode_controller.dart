import 'package:get/get.dart';
import 'package:task/screen/singleConvert_Screen.dart';
import 'package:task/screen/universal_convert_screen.dart';

class ConverterModeController extends GetxController {
  var mode = 1.obs;

  void setMode(int val) {
    mode.value = val;
  }

  void onGetStart() {
    if (mode.value == 1) {
      Get.to(() => const SingleconvertScreen());
    } else {
      Get.to(() => UniversalConvertScreen());
    }
  }
}
