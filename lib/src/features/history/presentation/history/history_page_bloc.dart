import 'package:ads_pay_app/src/features/tags/application/use_cases/watch_tags_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallet_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_page_events.dart';
import 'history_page_state.dart';

class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  final WatchWalletUseCase watchWallet;
  final WatchTagsUseCase watchTags;
  final String walletId;

  
  HistoryPageBloc(this.walletId, this.watchWallet, this.watchTags) : super(HistoryPageState(wallet: Wallet())) {

    on<HistoryPageLoadEvent>((event, emit) async {
      final walletStream = watchWallet(walletId);
      final tagsStream = watchTags();

      await emit.onEach(walletStream, onData: (wallet) {
        emit(state.copyWith(wallet: wallet));
      });
      await emit.onEach(tagsStream, onData: (tags) {
        emit(state.copyWith(tags: tags));
      });
    });
  }
  
}