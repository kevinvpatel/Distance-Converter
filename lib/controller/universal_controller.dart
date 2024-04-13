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
