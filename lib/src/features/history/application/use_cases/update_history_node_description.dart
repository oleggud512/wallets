import 'package:injectable/injectable.dart';

import '../../domain/repositories/history_repository.dart';


@Injectable()
class UpdateHistoryNodeUseCase {
  final HistoryRepository repo;

  UpdateHistoryNodeUseCase(this.repo);
  
  Future<void> call(
    String walletId, 
    String historyNodeId, 
    String newDescription
  ) async {
    await repo.updateHistoryNodeDescription(walletId, historyNodeId, newDescription);  
  }
}