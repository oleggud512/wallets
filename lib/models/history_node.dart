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
    required this.hid,
    required this.date,
    required this.amount,
    required this.action,
    required this.description,
    required this.tagName
  });

  factory HistoryNode.fromDataSnapshot(DataSnapshot snapshot) {
    // String a = snapshot.key!;
    // print('a $a');
    // DateTime b = DateTime.fromMillisecondsSinceEpoch(
    //       snapshot.child('date').value as int);
    // print('b $b');
    // double c = double.parse(snapshot.child('amount').value.toString());
    // print('c $c');
    // var d = snapshot.child('action').value as String == 'take'
    //     ? WalletAction.take 
    //     : WalletAction.add;
    // print('d $d');
    // String e = snapshot.child('description') as String;
    // print('e $e');
    // String f = snapshot.child('tag-name').toString();
    // print('f $f');
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

  factory HistoryNode.empty(WalletAction action) {
    return HistoryNode(
      hid: '',
      date: DateTime.now(),
      amount: 0,
      action: action,
      description: '',
      tagName: ''
    );
  }

  Map<String, dynamic> toJson() {
    // return {
    //   hid: {
    //     'date': date.millisecondsSinceEpoch,
    //     'amount': amount,
    //     'action': action.name,
    //     'description': description,
    //     'tid': tid
    //   }
    // };
    return {
      'date': date.millisecondsSinceEpoch,
      'amount': amount,
      'action': action.name,
      'description': description.trim(),
      'tag-name': tagName
    };
  }
}