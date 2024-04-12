import 'package:flutter/material.dart';

const String monfontfamily = 'montserrat';

extension MyStyles2 on num {
  TextStyle get monserrat200 => TextStyle(
      fontSize: toDouble(),
      fontWeight: FontWeight.w200,
      fontFamily: monfontfamily,
      color: Colors.black);
  TextStyle get monserrat300 => TextStyle(
      fontSize: toDouble(),
      fontWeight: FontWeight.w300,
      fontFamily: monfontfamily,
      color: Colors.black);
  TextStyle get monserrat400 => TextStyle(
      fontSize: toDouble(),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: monfontfamily);
  TextStyle get monserrat500 => TextStyle(
      fontSize: toDouble(),
      fontFamily: monfontfamily,
      fontWeight: FontWeight.w500,
      color: Colors.black);
  TextStyle get monserrat600 => TextStyle(
      fontSize: toDouble(),
      fontFamily: monfontfamily,
      fontWeight: FontWeight.w600,
      color: Colors.black);
  TextStyle get monserrat700 => TextStyle(
      fontSize: toDouble(),
      fontFamily: monfontfamily,
      fontWeight: FontWeight.w700,
      color: Colors.black);
  TextStyle get monserrat800 => TextStyle(
      fontSize: toDouble(),
      fontFamily: monfontfamily,
      fontWeight: FontWeight.w800,
      color: Colors.black);
}
