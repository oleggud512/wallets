import 'package:ads_pay_app/models/history_node.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Tag {
  String name;
  WalletAction action;
  Color color;

  Tag({
    required this.name,
    required this.action,
    this.color = Colors.grey
  });

  factory Tag.initial(WalletAction action) {
    return Tag(
      action: action,
      name: '',
      color: Colors.grey
    );
  }

  factory Tag.fromDataSnapshot(DataSnapshot snapshot) {
    return Tag(
      name: snapshot.key!,
      action: snapshot.child('action').value as String == 'take' 
        ? WalletAction.take 
        : WalletAction.add,
      color: Color(int.parse(snapshot.child('color').value.toString()))
    );
  }

  Map<String, String> toJson() {
    return {
      'name': name.trim(),
      'action': action.name,
      'color': color.value.toString()
    };
  }
}