
import '../../../tags/domain/entities/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_page_events.freezed.dart';

@freezed
class TransactionPageEvent with _$TransactionPageEvent {
  factory TransactionPageEvent() = _TransactionPageEvent;

  factory TransactionPageEvent.makeTransaction() = TransactionPageMakeTransactionEvent;
  factory TransactionPageEvent.tagChanged(Tag tag) = TransactionPageTagChangedEvent;
  factory TransactionPageEvent.amountChanged(double amount) = TransactionPageAmountChangedEvent;
  factory TransactionPageEvent.descriptionChanged(String description) = TransactionPageDescriptionChangedEvent;
}