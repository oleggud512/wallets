import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:ads_pay_app/src/features/wallets/domain/repositories/wallets_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class WatchWalletsUseCase {
  final WalletsRepository repo;

  WatchWalletsUseCase(this.repo);

  Stream<List<Wallet>> call() {
    return repo.watchWallets();
  }
}