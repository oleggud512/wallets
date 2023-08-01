import 'package:ads_pay_app/src/features/history/application/use_cases/make_transaction_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/transaction/transaction_page_events.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/transaction/transaction_page_states.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/logger.dart';
import '../../../history/domain/entities/history_node.dart';
import '../../../tags/domain/entities/tag.dart';

class TransactionPageBloc extends Bloc<TransactionPageEvent, TransactionPageState> {

  final WalletAction _action;
  final String walletId;

  final MakeTransactionUseCase makeTransactionUseCase;

  TransactionPageBloc(
    this.makeTransactionUseCase, 
    this.walletId, 
    WalletAction action
  ) : _action = action, super(TransactionPageState()) {

    on<TransactionPageMakeTransactionEvent>((event, emit) async {
      if (state.tag == null) return;
      await makeTransactionUseCase(
        walletId, 
        _action, 
        state.tag!.name,
        state.amount, 
        state.description
      );
    });

    on<TransactionPageTagChangedEvent>((event, emit) {
      emit.call(state.copyWith(tag: event.tag));
    });

    on<TransactionPageAmountChangedEvent>((event, emit) {
      emit.call(state.copyWith(amount: event.amount));
    });

    on<TransactionPageDescriptionChangedEvent>((event, emit) {
      emit.call(state.copyWith(description: event.description));
    });
  }

  @override
  Future<void> close() async {
    glogger.i('TransactionPageBloc IS CLOSED');
    await super.close();
  }
}