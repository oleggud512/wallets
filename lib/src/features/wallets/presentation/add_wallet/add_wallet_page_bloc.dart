import 'package:ads_pay_app/src/features/wallets/application/use_cases/add_wallet_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/add_wallet/add_wallet_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_wallet_page_events.dart';

class AddWalletPageBloc extends Bloc<AddWalletPageEvent, AddWalletPageState> {
  final AddWalletUseCase addWalletUseCase;

  AddWalletPageBloc(this.addWalletUseCase) : super(AddWalletPageState()) {

    on<AddWalletPageDescriptionChangedEvent>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<AddWalletPageAmountChangedEvent>((event, emit) {
      emit(state.copyWith(amount: event.amount));
    });

    on<AddWalletPageCurrencyChangedEvent>((event, emit) {
      emit(state.copyWith(currency: event.currency));
    });

    on<AddWalletPageAddWalletEvent>((event, emit) async {
      await addWalletUseCase.call(
        amount: state.amount,
        description: state.description, 
        currency: state.currency
      );
      event.onComplete();
    });
  }
}