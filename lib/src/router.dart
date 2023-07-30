import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/email_verification_page.dart';
import 'features/auth/presentation/login_page.dart';
import 'features/history/domain/entities/history_node.dart';
import 'features/history/presentation/history_page.dart';
import 'features/settings/presentation/settings_page.dart';
import 'features/tags/presentation/tags/tags_dialog.dart';
import 'features/wallets/domain/entities/wallet.dart';
import 'features/wallets/presentation/add_wallet/add_wallet_page.dart';
import 'features/wallets/presentation/transaction/transaction_page.dart';
import 'features/wallets/presentation/wallets/wallets_page.dart';

part 'router.gr.dart';
// part 'router.g.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final FirebaseAuthRepositoryImpl authServ;

  AppRouter(this.authServ);

  @override
  List<AutoRoute> get routes => [
    AutoRoute.guarded(
      page: WalletsRoute.page, 
      path: '/', 
      initial: true, 
      onNavigation: (NavigationResolver resolver, StackRouter router) async {
        await FirebaseAuth.instance.currentUser?.reload();
        print(FirebaseAuth.instance.currentUser);
        if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
          resolver.next(true);
        } else if (FirebaseAuth.instance.currentUser != null) {
          print('to verification');
          resolver.redirect(const EmailVerificationRoute()); // это значит, что чтобы перейти на WalletsRoute теперь понадобится сделать router.push(WalletsRoute)
        } else {
          resolver.redirect(LoginRoute(action: LoginAction.newUser));
        }
      }
    ),
    AutoRoute(
      page: HistoryRoute.page,
      path: '/history'
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute.guarded(
      page: EmailVerificationRoute.page, 
      path: '/login/email-verification',
      onNavigation: (NavigationResolver resolver, StackRouter router) async {
        await FirebaseAuth.instance.currentUser?.reload();
        print('verification verification verification');
        print('email verification ${FirebaseAuth.instance.currentUser}');
        if (FirebaseAuth.instance.currentUser != null) {
          resolver.next(true);
        } else {
          resolver.redirect(LoginRoute(action: LoginAction.newUser));
        }
      }
    ),
    AutoRoute(
      page: SettingsRoute.page,
      path: '/settings',
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