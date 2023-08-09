import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeleteWalletUseCase {
  final WalletsRepository repo;

  DeleteWalletUseCase(this.repo);

  Future<void> call(String walletId) {
    return repo.deleteWallet(walletId);
  }
}