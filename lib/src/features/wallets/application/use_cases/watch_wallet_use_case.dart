import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/wallet.dart';


@Injectable()
class WatchWalletUseCase {
  final WalletsRepository repo;

  WatchWalletUseCase(this.repo);
  
  Stream<Wallet> call(String id) {
    return repo.watchWallet(id);
  }
}