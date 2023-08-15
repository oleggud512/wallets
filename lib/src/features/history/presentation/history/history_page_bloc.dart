import 'dart:async';

import 'package:ads_pay_app/src/features/tags/application/use_cases/watch_tags_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallet_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tags/domain/entities/tag.dart';
import 'history_page_events.dart';
import 'history_page_state.dart';

class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  final WatchWalletUseCase watchWallet;
  final WatchTagsUseCase watchTags;
  final String walletId;

  StreamSubscription<Wallet>? walletSubscr;
  StreamSubscription<List<Tag>>? tagsSubscr;

  
  HistoryPageBloc(this.walletId, this.watchWallet, this.watchTags) : super(HistoryPageState(wallet: Wallet())) {

    on<HistoryPageLoadEvent>((event, emit) async {
      final walletStream = watchWallet(walletId);
      final tagsStream = watchTags();

      walletSubscr?.cancel();
      tagsSubscr?.cancel();

      walletSubscr = walletStream
        .listen((wallet) => add(HistoryPageWalletReceivedEvent(wallet)));
      tagsSubscr = tagsStream
        .listen((tags) => add(HistoryPageTagsReceivedEvent(tags)));
    });

    on<HistoryPageWalletReceivedEvent>((event, emit) {
      emit(state.copyWith(wallet: event.wallet));
    });

    on<HistoryPageTagsReceivedEvent>((event, emit) {
      emit(state.copyWith(tags: event.tags));
    });
  }

  @override
  Future<void> close() async {
    await walletSubscr?.cancel();
    await tagsSubscr?.cancel();
    return await super.close();
  }
  
}