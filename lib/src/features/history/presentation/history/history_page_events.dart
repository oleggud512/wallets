import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../tags/domain/entities/tag.dart';

part 'history_page_events.freezed.dart';

@freezed
class HistoryPageEvent with _$HistoryPageEvent {
  factory HistoryPageEvent() = _HistoryPageEvent;

  factory HistoryPageEvent.load() = HistoryPageLoadEvent;

  factory HistoryPageEvent.tagsReceived(List<Tag> tags) = HistoryPageTagsReceivedEvent;
  factory HistoryPageEvent.walletReceived(Wallet wallet) = HistoryPageWalletReceivedEvent;
}