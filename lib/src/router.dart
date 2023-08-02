import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

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

/// Checks if an email is verified. 
/// If it's not verified redirects to the verification page. 
/// Should not be used without [SignedInGuard]
class EmailVerifiedGuard extends AutoRouteGuard {
  final AuthRepository repo;

  EmailVerifiedGuard(this.repo);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (repo.isEmailVerified) return resolver.next(true);
    resolver.redirect(const EmailVerificationRoute());
  }
}

/// Checks if the user is signed in.
/// Redirects to the login page if he isn't. 
class SignedInGuard extends AutoRouteGuard {
  final AuthRepository repo;

  SignedInGuard(this.repo);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (repo.isSignedIn) return resolver.next(true);
    resolver.redirect(LoginRoute(action: LoginAction.newUser));
  }
}

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
    // AutoRoute.guarded(
    //   page: WalletsRoute.page, 
    //   path: '/', 
    //   initial: true, 
    //   onNavigation: (NavigationResolver resolver, StackRouter router) async {
    //     if (authRepo.isEmailVerified) {
    //       resolver.next(true);
    //     } else if (authRepo.isSignedIn) {
    //       print('to verification');
    //       resolver.redirect(const EmailVerificationRoute()); // это значит, что чтобы перейти на WalletsRoute теперь понадобится сделать router.push(WalletsRoute)
    //     } else {
    //       resolver.redirect(LoginRoute(action: LoginAction.newUser));
    //     }
    //   }
    // ),
    // AutoRoute.guarded(
    //   page: EmailVerificationRoute.page, 
    //   path: '/login/email-verification',
    //   onNavigation: (NavigationResolver resolver, StackRouter router) async {
    //     // print('verification verification verification');
    //     // print('email verification ${FirebaseAuth.instance.currentUser}');
    //     if (authRepo.isEmailVerified) {
    //       resolver.next(true);
    //     } else {
    //       resolver.redirect(LoginRoute(action: LoginAction.newUser));
    //     }
    //   }
    // ),
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