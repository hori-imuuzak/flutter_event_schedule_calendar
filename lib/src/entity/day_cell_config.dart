import 'package:flutter/material.dart';

class CellConfig {
  final double fontSize;
  final double dayCellBorderWidth;
  final double selectedBorderWidth;
  final BorderStyle selectedBorderStyle;

  CellConfig({
    this.fontSize = 10,
    this.dayCellBorderWidth = 0.5,
    this.selectedBorderStyle = BorderStyle.solid,
    this.selectedBorderWidth = 1,
  });
}
