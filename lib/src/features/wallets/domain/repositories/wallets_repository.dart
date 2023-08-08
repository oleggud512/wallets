import '../entities/wallet.dart';

abstract interface class WalletsRepository {
  Stream<List<Wallet>> watchWallets();
  Stream<Wallet> watchWallet(String id);
  Future<void> deleteWallet(String wid);
  Future<void> addWallet(Wallet wallet);
  Future<void> updateWalletDescription(String wid, String newDescription);
}