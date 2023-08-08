import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart';
import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/constants/strings.dart';

@Singleton(as: WalletsRepository)
class FirebaseWalletsRepositoryImpl implements WalletsRepository {
  FirebaseWalletsRepositoryImpl(this.source);

  FirebaseUserDataSource source;

  @override
  Future<void> addWallet(Wallet wallet) async {
    var walletRef = source.userRef.child(FirebaseStrings.wallets).push();
    wallet.wid = walletRef.key!;
    await walletRef.update(wallet.toJson());
  }

  @override
  Future<void> deleteWallet(String wid) {
    return source.userRef.child(FirebaseStrings.wallet(wid)).remove();
  }

  @override
  Future<void> updateWalletDescription(String wid, String newDescription) {
    return source.userRef.child(FirebaseStrings.walletDescription(wid))
      .set(newDescription);
  }

  @override
  Stream<List<Wallet>> watchWallets() {
    return source.userRef.child(FirebaseStrings.wallets).onValue.map(
      (ev) => ev.snapshot.children.map(Wallet.fromDataSnapshot).toList()
    );
  }

  Stream<Wallet> watchWallet(String id) {
    return source.userRef.child(FirebaseStrings.wallets).child(id).onValue
      .map((event) => Wallet.fromDataSnapshot(event.snapshot));
  }
}