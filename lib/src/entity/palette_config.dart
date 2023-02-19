import 'package:flutter/material.dart';

class PaletteConfig {
  final Color today;
  final Color boxColor;
  final Color todayFontColor;
  final Color selectedBorder;
  final Color dayFontColorInMonth;
  final Color dayFontColorNotInMonth;

  PaletteConfig({
    this.today = Colors.blue,
    this.boxColor = Colors.black,
    this.todayFontColor = Colors.white,
    this.selectedBorder = Colors.transparent,
    this.dayFontColorInMonth = Colors.black,
    this.dayFontColorNotInMonth = Colors.black45,
  });
}
