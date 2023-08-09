import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.g.dart';
part 'tag.freezed.dart';
/*
class Tag {
  String name;
  WalletAction action;
  Color color;

  Tag({
    this.name = '',
    required this.action,
    this.color = Colors.grey
  });

  // factory Tag.initial(WalletAction action) {
  //   return Tag(
  //     action: action,
  //     name: '',
  //     color: Colors.grey
  //   );
  // }

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
*/

String colorToJson(Color color) {
  return color.value.toString();
}

@Freezed(toJson: true, fromJson: false)
class Tag with _$Tag {
  factory Tag({
    required WalletAction action,
    @Default('') 
    String name,
    @Default(Colors.grey) 
    @JsonKey(toJson: colorToJson) // ignore: invalid_annotation_target
    Color color,
  }) = _Tag;

  factory Tag.fromDataSnapshot(DataSnapshot snapshot) {
    return Tag(
      name: snapshot.key!,
      action: snapshot.child('action').value as String == 'take' 
        ? WalletAction.take 
        : WalletAction.add,
      color: Color(int.parse(snapshot.child('color').value.toString()))
    );
  }
}