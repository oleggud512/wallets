import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/history/domain/repositories/history_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MakeTransactionUseCase {
  final HistoryRepository repo;

  MakeTransactionUseCase(this.repo);

  Future<void> call(
    String walletId, 
    WalletAction action, 
    double amount, 
    String? tagName,
    [String description = '']
  ) async {
    final data = HistoryNode(
      action: action, 
      tagName: tagName ?? '', // TODO: make HistoryNode.tagName nullable
      amount: amount, 
      description: description
    );
    await repo.makeTransaction(walletId, data);
  }
}