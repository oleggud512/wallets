import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_wallet_page_states.freezed.dart';

@freezed
class AddWalletPageState with _$AddWalletPageState {
  factory AddWalletPageState({
    @Default('') String description, 
    @Default('') String currency, 
    @Default(0) double amount,
  }) = _AddWalletPageState;
}