import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:equatable/equatable.dart';

sealed class WalletsPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletsPageDefaultState extends WalletsPageState {
  final List<Wallet> wallets;

  WalletsPageDefaultState(this.wallets);

  @override
  List<Object?> get props => [wallets];
}