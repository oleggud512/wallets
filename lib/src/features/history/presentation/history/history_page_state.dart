import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../tags/domain/entities/tag.dart';

part 'history_page_state.freezed.dart';

@freezed
class HistoryPageState with _$HistoryPageState {
  factory HistoryPageState({
    required Wallet wallet,
    @Default([]) List<Tag> tags
  }) = _HistoryPageState;
}