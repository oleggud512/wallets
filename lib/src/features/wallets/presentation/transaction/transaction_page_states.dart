import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_page_states.freezed.dart';

@freezed
class TransactionPageState with _$TransactionPageState {
  factory TransactionPageState({
    Tag? tag,
    @Default(0) double amount,
    @Default('') String description
  }) = _TransactionPageState;
}