import 'package:equatable/equatable.dart';

sealed class WalletsPageEvent extends Equatable { 
  @override
  List<Object?> get props => [];
}

final class WalletsPageStartEvent extends WalletsPageEvent { }

final class WalletsPageDeleteWalletEvent extends WalletsPageEvent {
  final String walletId;

  WalletsPageDeleteWalletEvent(this.walletId);

  @override
  List<Object?> get props => [walletId];
}