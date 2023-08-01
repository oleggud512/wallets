import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/wallet.dart';

@Injectable()
class AddWalletUseCase {
  final WalletsRepository repo;

  AddWalletUseCase(this.repo);

  Future<void> call({ 
    String description = '',
    String currency = '',
    double amount = 0, 
  }) async {
    await repo.addWallet(Wallet(
      amount: amount, 
      currency: currency, 
      description: description
    ));
  }
}