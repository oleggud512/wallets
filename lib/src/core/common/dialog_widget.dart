import 'package:flutter/material.dart';

mixin DialogWidget<T> on Widget {
  Future<T?> show(BuildContext context) {
    return showDialog<T>(context: context, builder: (context) => this);
  }
}