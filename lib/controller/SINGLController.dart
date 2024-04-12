import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleController extends GetxController {
  String fromUnit = 'Meter';
  String toUnit = 'Centimeter';
  double inputValue = 0.0;
  double convertedValue = 0.0;
  RxBool isValid = false.obs;
  final TextEditingController inputController = TextEditingController();
  void convert() {
    double valueInMeter;
    // Convert input value to meter
    switch (fromUnit) {
      case 'Meter':
        valueInMeter = inputValue;
        break;
      case 'Centimeter':
        valueInMeter = inputValue / 100.0;
        break;
      case 'Kilometer':
        valueInMeter = inputValue * 1000.0;
        break;
      case 'Foot':
        valueInMeter = inputValue * 0.3048;
        break;
      case 'Inch':
        valueInMeter = inputValue * 0.0254;
        break;
      case 'Mile':
        valueInMeter = inputValue * 1609.34;
        break;

      default:
        valueInMeter = inputValue;
        break;
    }
    // Convert meter to desired unit
    switch (toUnit) {
      case 'Meter':
        convertedValue = valueInMeter;
        break;
      case 'Centimeter':
        convertedValue = valueInMeter * 100.0;
        break;
      case 'Kilometer':
        convertedValue = valueInMeter / 1000.0;
        break;
      case 'Foot':
        convertedValue = valueInMeter / 0.3048;
        break;
      case 'Inch':
        convertedValue = valueInMeter / 0.0254;
        break;
      case 'Mile':
        convertedValue = valueInMeter / 1609.34;
        break;
      default:
        convertedValue = valueInMeter;
        break;
    }
  }

  List fromtext = ['Meter', 'Centimeter', 'Kilometer', 'Foot', 'Inch', 'Mile'];
  List toist = ['Meter', 'Centimeter', 'Kilometer', 'Foot', 'Inch', 'Mile'];
}
