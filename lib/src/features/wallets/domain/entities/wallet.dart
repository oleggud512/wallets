import 'package:firebase_database/firebase_database.dart';

import '../../../history/domain/entities/history_node.dart';


Map<String, dynamic> historyNodeListToJson(List<HistoryNode> history) {
  Map<String, dynamic> historyJson = {};
  for (HistoryNode node in history) {
    historyJson.addAll(node.toJson());
  }
  return historyJson;
}


class Wallet {
  String wid;
  DateTime creationDate;
  DateTime lastUpdated;
  double amount;
  String currency;
  String description;
  List<HistoryNode> history;

  Wallet({
    this.wid = '',
    this.amount = 0,
    this.currency = '',
    this.description = '',
    List<HistoryNode>? history,
    DateTime? creationDate,
    DateTime? lastUpdated,
  }) : history = history ?? [],
    creationDate = creationDate ?? DateTime.now(),
    lastUpdated = lastUpdated ?? DateTime.now();
  
  factory Wallet.fromDataSnapshot(DataSnapshot snapshot) {
    var resWal = Wallet(
      wid: snapshot.key!,
      creationDate: DateTime.fromMillisecondsSinceEpoch(
          snapshot.child('creation-date').value as int),
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(
          snapshot.child('last-updated').value as int),
      amount: double.parse(snapshot.child('amount').value.toString()),
      currency: snapshot.child('currency').value as String,
      description: snapshot.child('description').value as String,
      history: snapshot.hasChild('history') 
        ? () {
          List<HistoryNode> hns = snapshot.child('history').children.map(
            (hs) => HistoryNode.fromDataSnapshot(hs)
          ).toList().reversed.toList();
          hns.sort((a, b) => b.date.compareTo(a.date));
          return hns;
        }()
        : []
    );
    return resWal;
  }

  Map<String, dynamic> toJson() {
    // return {
    //   wid: {
    //     'creation-date': creationDate.millisecondsSinceEpoch,
    //     'last-updated': lastUpdated.millisecondsSinceEpoch,
    //     'amount': amount,
    //     'currency': currency,
    //     'description': description,
    //     'history': historyNodeListToJson(history)
    //   }
    // };
    return {
      'creation-date': creationDate.millisecondsSinceEpoch,
      'last-updated': lastUpdated.millisecondsSinceEpoch,
      'amount': amount,
      'currency': currency,
      'description': description.trim(),
      'history': historyNodeListToJson(history)
    };
  }

}