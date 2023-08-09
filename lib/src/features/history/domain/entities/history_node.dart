import 'package:firebase_database/firebase_database.dart';

enum WalletAction {
  add,
  take
}

class HistoryNode {
  String hid;
  DateTime date;
  double amount;
  WalletAction action;
  String description;
  String tagName;

  HistoryNode({
    this.hid = '',
    required this.action,
    DateTime? date,
    this.amount = 0,
    this.description = '',
    this.tagName = '',
  }) : date = date ?? DateTime.now();

  factory HistoryNode.fromDataSnapshot(DataSnapshot snapshot) {
    return HistoryNode(
      hid: snapshot.key!,
      date: DateTime.fromMillisecondsSinceEpoch(
          snapshot.child('date').value as int),
      amount: double.parse(snapshot.child('amount').value.toString()),
      action: snapshot.child('action').value as String == 'take'
        ? WalletAction.take 
        : WalletAction.add,
      description: snapshot.child('description').value as String,
      tagName: snapshot.child('tag-name').value as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.millisecondsSinceEpoch,
      'amount': amount,
      'action': action.name,
      'description': description.trim(),
      'tag-name': tagName
    };
  }
}