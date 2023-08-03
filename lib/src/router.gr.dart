// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    TagsDialogRoute.name: (routeData) {
      final args = routeData.argsAs<TagsDialogRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TagsDialog(
          key: args.key,
          action: args.action,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HistoryPage(
          key: args.key,
          walletId: args.walletId,
        ),
      );
    },
    TransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransactionPage(
          key: args.key,
          action: args.action,
          wallet: args.wallet,
        ),
      );
    },
    WalletsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WalletsPage(),
      );
    },
    AddWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddWalletPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          action: args.action,
        ),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmailVerificationPage(),
      );
    },
  };
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
          args: TagsDialogRouteArgs(
            key: key,
            action: action,
          ),
          initialChildren: children,
        );

  static const String name = 'TagsDialogRoute';

  static const PageInfo<TagsDialogRouteArgs> page =
      PageInfo<TagsDialogRouteArgs>(name);
}

class TagsDialogRouteArgs {
  const TagsDialogRouteArgs({
    this.key,
    required this.action,
  });

  final Key? key;

  final WalletAction action;

  @override
  String toString() {
    return 'TagsDialogRouteArgs{key: $key, action: $action}';
  }
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
          args: HistoryRouteArgs(
            key: key,
            walletId: walletId,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<HistoryRouteArgs> page =
      PageInfo<HistoryRouteArgs>(name);
}

class HistoryRouteArgs {
  const HistoryRouteArgs({
    this.key,
    required this.walletId,
  });

  final Key? key;

  final String walletId;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key, walletId: $walletId}';
  }
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
          args: TransactionRouteArgs(
            key: key,
            action: action,
            wallet: wallet,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionRoute';

  static const PageInfo<TransactionRouteArgs> page =
      PageInfo<TransactionRouteArgs>(name);
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
}

/// generated route for
/// [WalletsPage]
class WalletsRoute extends PageRouteInfo<void> {
  const WalletsRoute({List<PageRouteInfo>? children})
      : super(
          WalletsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddWalletPage]
class AddWalletRoute extends PageRouteInfo<void> {
  const AddWalletRoute({List<PageRouteInfo>? children})
      : super(
          AddWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddWalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    LoginAction action = LoginAction.newUser,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            action: action,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.action = LoginAction.newUser,
  });

  final Key? key;

  final LoginAction action;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, action: $action}';
  }
}

/// generated route for
/// [EmailVerificationPage]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
