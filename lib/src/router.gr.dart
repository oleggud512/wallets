// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AddWalletPage]
class AddWalletRoute extends PageRouteInfo<void> {
  const AddWalletRoute({List<PageRouteInfo>? children})
    : super(AddWalletRoute.name, initialChildren: children);

  static const String name = 'AddWalletRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddWalletPage();
    },
  );
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
    : super(DeleteAccountRoute.name, initialChildren: children);

  static const String name = 'DeleteAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DeleteAccountPage();
    },
  );
}

/// generated route for
/// [EmailVerificationPage]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
    : super(EmailVerificationRoute.name, initialChildren: children);

  static const String name = 'EmailVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmailVerificationPage();
    },
  );
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({
    Key? key,
    required String walletId,
    List<PageRouteInfo>? children,
  }) : super(
         HistoryRoute.name,
         args: HistoryRouteArgs(key: key, walletId: walletId),
         initialChildren: children,
       );

  static const String name = 'HistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HistoryRouteArgs>();
      return HistoryPage(key: args.key, walletId: args.walletId);
    },
  );
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key, required this.walletId});

  final Key? key;

  final String walletId;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key, walletId: $walletId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HistoryRouteArgs) return false;
    return key == other.key && walletId == other.walletId;
  }

  @override
  int get hashCode => key.hashCode ^ walletId.hashCode;
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [TagsDialog]
class TagsDialogRoute extends PageRouteInfo<TagsDialogRouteArgs> {
  TagsDialogRoute({
    Key? key,
    required WalletAction action,
    List<PageRouteInfo>? children,
  }) : super(
         TagsDialogRoute.name,
         args: TagsDialogRouteArgs(key: key, action: action),
         initialChildren: children,
       );

  static const String name = 'TagsDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TagsDialogRouteArgs>();
      return TagsDialog(key: args.key, action: args.action);
    },
  );
}

class TagsDialogRouteArgs {
  const TagsDialogRouteArgs({this.key, required this.action});

  final Key? key;

  final WalletAction action;

  @override
  String toString() {
    return 'TagsDialogRouteArgs{key: $key, action: $action}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TagsDialogRouteArgs) return false;
    return key == other.key && action == other.action;
  }

  @override
  int get hashCode => key.hashCode ^ action.hashCode;
}

/// generated route for
/// [TransactionPage]
class TransactionRoute extends PageRouteInfo<TransactionRouteArgs> {
  TransactionRoute({
    Key? key,
    required WalletAction action,
    required Wallet wallet,
    List<PageRouteInfo>? children,
  }) : super(
         TransactionRoute.name,
         args: TransactionRouteArgs(key: key, action: action, wallet: wallet),
         initialChildren: children,
       );

  static const String name = 'TransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionRouteArgs>();
      return TransactionPage(
        key: args.key,
        action: args.action,
        wallet: args.wallet,
      );
    },
  );
}

class TransactionRouteArgs {
  const TransactionRouteArgs({
    this.key,
    required this.action,
    required this.wallet,
  });

  final Key? key;

  final WalletAction action;

  final Wallet wallet;

  @override
  String toString() {
    return 'TransactionRouteArgs{key: $key, action: $action, wallet: $wallet}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransactionRouteArgs) return false;
    return key == other.key && action == other.action && wallet == other.wallet;
  }

  @override
  int get hashCode => key.hashCode ^ action.hashCode ^ wallet.hashCode;
}

/// generated route for
/// [WalletsPage]
class WalletsRoute extends PageRouteInfo<void> {
  const WalletsRoute({List<PageRouteInfo>? children})
    : super(WalletsRoute.name, initialChildren: children);

  static const String name = 'WalletsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WalletsPage();
    },
  );
}
