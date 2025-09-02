import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:equatable/equatable.dart';

sealed class WalletsPageState extends Equatable {}

class WalletsPageDefaultState extends WalletsPageState {
  final List<Wallet> wallets;

  WalletsPageDefaultState(this.wallets);

  @override
  List<Object?> get props => [wallets];
}
