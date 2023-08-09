import 'package:ads_pay_app/src/features/history/domain/repositories/history_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class DeleteHistoryNodeUseCase {
  final HistoryRepository repo;

  DeleteHistoryNodeUseCase(this.repo);
  
  Future<void> call(String walletId, String historyNodeId) async {
    repo.deleteHistoryNode(walletId, historyNodeId);
  }
}