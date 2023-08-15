import 'package:flutter/material.dart';

extension MultiplyColor on Color {

  operator * (double v) {
    return Color.fromARGB(
      alpha, 
      (red * v).toInt(), 
      (green * v).toInt(), 
      (blue * v).toInt()
    );
  }
}