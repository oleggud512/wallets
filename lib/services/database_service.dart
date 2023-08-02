import 'package:ads_pay_app/src/core/application/errors/exceptions.dart';
import 'package:ads_pay_app/src/core/common/constants/strings.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/account.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../src/features/tags/domain/entities/tag.dart';
import '../src/features/wallets/domain/entities/wallet.dart';

abstract interface class AccountRepository {
  Stream<Account> watchAccount();
  Future<void> deleteAccount();
}

class DatabaseService {
  FirebaseDatabase db = FirebaseDatabase.instance;

  String? get uid => FirebaseAuth.instance.currentUser?.uid;
  DatabaseReference get userRef => db.ref(FirebaseStrings.account(uid ?? ''));

  Stream<Account> watchAccount() { // 
    return userRef.onValue.map(
      (event) {
        return Account.fromDataSnapshot(event.snapshot);
      }
    );
  }

  Future<void> deleteAccount() async { // 
    userRef.remove();
  }

  Stream<List<Wallet>> watchWallets() {
    return userRef.child(FirebaseStrings.wallets).onValue.map(
      (ev) => ev.snapshot.children.map(Wallet.fromDataSnapshot).toList()
    );
  }

  Future<void> addWallet(Wallet wallet) async { //
    var walletRef = userRef.child(FirebaseStrings.wallets).push();
    wallet.wid = walletRef.key!;
    await walletRef.update(wallet.toJson());
  }

  Future<void> updateWalletDescription(String wid, String newDescription) {
    return userRef.child(FirebaseStrings.walletDescription(wid))
      .set(newDescription);
  }

  Future<void> deleteWallet(String wid) { //
    return userRef.child(FirebaseStrings.wallet(wid)).remove();
  }

  Stream<List<Tag>> watchTags() { //
    return userRef.child(FirebaseStrings.tags).onValue.map(
      (event) => event.snapshot.children.map(Tag.fromDataSnapshot).toList()
    );
  }

  Future<void> addTag(Tag tag) { //
    return userRef.child(FirebaseStrings.tag(tag.name)).update(tag.toJson());
  }

  Future<void> deleteTag(String name) async { //
    userRef.child(FirebaseStrings.tag(name)).remove();
  }

  Future<void> makeTransaction(String walletId, HistoryNode transactionData) async { //
    await userRef.child(FirebaseStrings.wallet(walletId)).runTransaction((Object? wallet) {
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

    await userRef.child(FirebaseStrings.historyOf(walletId))
      .orderByChild(FirebaseStrings.date)
      .ref
      .push()
      .update(transactionData.toJson());
  }

  void updateHistoryNodeDescription( //
      String wid, String hid, String newDescription) {
    userRef.child(FirebaseStrings.historyNodeDescription(wid, hid)).set(newDescription);
  }

  Future<void> deleteHistoryNode(String wid, HistoryNode historyNode) async { //
    await userRef.child(FirebaseStrings.historyNode(wid, historyNode.hid)).remove();
  }

}
