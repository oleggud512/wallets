import 'package:ads_pay_app/src/features/wallets/application/use_cases/delete_wallet_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/application/use_cases/watch_wallets_use_case.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_event.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WalletsPageBloc extends Bloc<WalletsPageEvent, WalletsPageState> {
  DeleteWalletUseCase delteteWalletUseCase;
  WatchWalletsUseCase watchWalletsUseCase;
  
  WalletsPageBloc(this.delteteWalletUseCase, this.watchWalletsUseCase) : super(WalletsPageDefaultState(const [])) {
    on<WalletsPageStartEvent>((event, emit) async {
      final walletsStream = watchWalletsUseCase();
      await emit.onEach(walletsStream, 
        onData: (wallets) {
          emit(WalletsPageDefaultState(wallets));
        }
      );
    });
    
    on<WalletsPageDeleteWalletEvent>((event, emit) async {
      await delteteWalletUseCase(event.walletId);
    });
  }
}