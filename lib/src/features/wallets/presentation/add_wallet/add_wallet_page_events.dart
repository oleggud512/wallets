import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_wallet_page_events.freezed.dart';

@freezed
class AddWalletPageEvent with _$AddWalletPageEvent {
  factory AddWalletPageEvent() = _AddWalletPageEvent;

  factory AddWalletPageEvent.descriptionChanged(String description) = AddWalletPageDescriptionChangedEvent;
  factory AddWalletPageEvent.amountChanged(double amount) = AddWalletPageAmountChangedEvent;
  factory AddWalletPageEvent.currencyChanged(String currency) = AddWalletPageCurrencyChangedEvent;
  factory AddWalletPageEvent.addWallet(VoidCallback onComplete) = AddWalletPageAddWalletEvent;
}