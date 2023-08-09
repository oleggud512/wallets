import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../../core/application/errors/exceptions.dart';
import '../../../core/common/constants/strings.dart';
import '../domain/repositories/history_repository.dart';

@Singleton(as: HistoryRepository)
class FirebaseHistoryRepositoryImpl implements HistoryRepository {
  const FirebaseHistoryRepositoryImpl(this.source);

  final FirebaseUserDataSource source;

  @override
  Future<void> deleteHistoryNode(String walletId, String nodeId) async {
    await source.userRef.child(FirebaseStrings.historyNode(walletId, nodeId))
      .remove();
  }

  @override
  Future<void> makeTransaction(String walletId, HistoryNode transactionData) async {
    await source.userRef.child(FirebaseStrings.wallet(walletId)).runTransaction((Object? wallet) {
      final walMap = Map<String, dynamic>.from(wallet as Map);

      if (transactionData.action == WalletAction.add) {
        walMap[FirebaseStrings.amount] += transactionData.amount;
      } else {
        if (double.parse(walMap[FirebaseStrings.amount].toString()) < transactionData.amount) {
          throw NotEnoughMoneyException();
        }
        walMap[FirebaseStrings.amount] -= transactionData.amount;
      }

      walMap[FirebaseStrings.lastUpdated] = transactionData.date.millisecondsSinceEpoch;
      return Transaction.success(walMap);
    });

    await source.userRef.child(FirebaseStrings.historyOf(walletId))
      .orderByChild(FirebaseStrings.date)
      .ref
      .push()
      .update(transactionData.toJson());
  }

  @override
  Future<void> updateHistoryNodeDescription(
    String wid, 
    String hid, 
    String newDescription
  ) async {
    await source.userRef.child(FirebaseStrings.historyNodeDescription(wid, hid))
      .set(newDescription);
  }
}
