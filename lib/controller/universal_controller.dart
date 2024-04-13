import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversalController extends GetxController {
  String fromUnit = 'Meter';
  RxString toUnit = 'Centimeter'.obs;
  double inputValue = 0.0;
  double convertedValue = 0.0;
  double convertedMeter = 0.0;
  double convertedCentimeter = 0.0;
  double convertedKilometer = 0.0;
  double convertedFoot = 0.0;
  double convertedInch = 0.0;
  double convertedMile = 0.0;
  double convertedYard = 0.0;
  double convertedMillimeter = 0.0;
  double convertedNM = 0.0;
  RxBool isValid = false.obs;
  final TextEditingController inputController = TextEditingController();
  void convert() {
    double valueInMeter;
    // Convert input value to meter
    switch (toUnit.value) {
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
      case 'Yard':
        valueInMeter = inputValue * 0.9144;
        break;
      default:
        valueInMeter = inputValue;
        break;
    }

    convertedValue = valueInMeter;
    log(convertedValue.toString());
    // convertedMeter = valueInMeter;

    // convertedCentimeter = valueInMeter * 100.0;

    // convertedKilometer = valueInMeter / 1000.0;

    // convertedFoot = valueInMeter / 0.3048;

    // convertedInch = valueInMeter / 0.0254;

    // convertedMile = valueInMeter / 1609.34;

    // convertedYard = valueInMeter / 0.9144;

    // convertedMillimeter = valueInMeter * 1000.0;

    // convertedNM = valueInMeter / 1852.0;
  }

  double convertValue(String value) {
    switch (value) {
      case 'Meter':
        return convertedValue;

      case 'Centimeter':
        return convertedValue * 100.0;

      case 'Kilometer':
        return convertedValue / 1000.0;

      case 'Foot':
        return convertedValue / 0.3048;

      case 'Inch':
        return convertedValue / 0.0254;

      case 'Yard':
        return convertedValue / 0.9144;

      default:
        return convertedValue;
    }
  }

  List fromtext = ['Meter', 'Centimeter', 'Kilometer', 'Foot', 'Inch', 'Yard'];
  List toist = ['Meter', 'Centimeter', 'Kilometer', 'Foot', 'Inch', 'Yard'];

  RxList<UCModel> ucList = <UCModel>[].obs;

  void addList() {
    ucList.clear();
    toist.forEach((element) {
      if (element != toUnit.value) {
        ucList.add(UCModel(convertedText: convertedValue, unit: element));
      }
    });
  }
}

class UCModel {
  double? convertedText;
  String? unit;
  UCModel({this.convertedText, this.unit});
}
