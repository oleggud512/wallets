import 'package:injectable/injectable.dart';

import '../../domain/repositories/wallets_repository.dart';


@Injectable()
class UpdateWalletDescriptionUseCase {
  final WalletsRepository repo;

  UpdateWalletDescriptionUseCase(this.repo);
  
  Future<void> call(String walletId, String newDescription) async {
    await repo.updateWalletDescription(walletId, newDescription);
  }
}