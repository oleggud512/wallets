import '../entities/history_node.dart';

abstract interface class HistoryRepository {
  Future<void> makeTransaction(String walletId, HistoryNode transactionData);
  Future<void> updateHistoryNodeDescription(
    String walletId, String historyNodeId, String newDescription);
  Future<void> deleteHistoryNode(String walletId, String historyNodeId);
}