import 'package:flutter/material.dart';

class appThemeColors {
  static final appThemeColors _colors = appThemeColors._internal();

  appThemeColors._internal();

  factory appThemeColors() {
    return _colors;
  }

  static const Color appThemeColor = Color(0xff9395D3);
  static const Color appScaffoldColor = Color(0xffD6D7EF);
}
