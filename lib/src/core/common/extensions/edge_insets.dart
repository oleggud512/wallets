import 'package:flutter/material.dart';

extension EdgeInsetsExt on EdgeInsets {
  static EdgeInsets left(double p) => EdgeInsets.only(left: p);
  static EdgeInsets top(double p) => EdgeInsets.only(top: p);
  static EdgeInsets right(double p) => EdgeInsets.only(right: p);
  static EdgeInsets bottom(double p) => EdgeInsets.only(bottom: p);
  static EdgeInsets horizontal(double p) => EdgeInsets.symmetric(horizontal: p);
  static EdgeInsets vertical(double p) => EdgeInsets.symmetric(vertical: p);
}