import 'package:flutter/material.dart';

mixin DialogWidget on Widget {
  Future<dynamic> show(BuildContext context) {
    return showDialog(context: context, builder: (context) => this);
  }
}