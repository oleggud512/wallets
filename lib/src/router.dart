import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'features/auth/application/guards/email_verified_guard.dart';
import 'features/auth/application/guards/signed_in_guard.dart';
import 'features/auth/presentation/delete_account/delete_account_page.dart';
import 'features/auth/presentation/email_verification/email_verification_page.dart';
import 'features/auth/presentation/login/login_page.dart';
import 'features/history/domain/entities/history_node.dart';
import 'features/history/presentation/history_page.dart';
import 'features/settings/presentation/settings_page.dart';
import 'features/tags/presentation/tags/tags_dialog.dart';
import 'features/wallets/domain/entities/wallet.dart';
import 'features/wallets/presentation/add_wallet/add_wallet_page.dart';
import 'features/wallets/presentation/transaction/transaction_page.dart';
import 'features/wallets/presentation/wallets/wallets_page.dart';

part 'router.gr.dart';


@Singleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final AuthRepository authRepo;

  AppRouter(this.authRepo);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: WalletsRoute.page, 
      path: '/', 
      initial: true, 
      guards: [SignedInGuard(authRepo), EmailVerifiedGuard(authRepo)]
    ),
    AutoRoute(
      page: EmailVerificationRoute.page,
      path: '/login/email-verification',
      guards: [SignedInGuard(authRepo)]
    ),
    AutoRoute(
      page: HistoryRoute.page,
      path: '/history'
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: SettingsRoute.page,
      path: '/settings',
    ),
    AutoRoute(
      page: DeleteAccountRoute.page,
      path: '/settings/delete-account',
    ),
    AutoRoute(
      page: AddWalletRoute.page,
      path: '/add-wallet',
    ),
    AutoRoute(
      page: TransactionRoute.page,
      path: '/transaction',
    ),
    AutoRoute(
      page: TagsDialogRoute.page,
      path: '/transaction/tags'
    )
  ];

}