import 'package:auto_route/auto_route.dart';

import '../../../../router.dart';
import '../../domain/repositories/auth_repository.dart';

/// Checks if an email is verified. 
/// If it's not verified redirects to the verification page. 
/// Should not be used without [SignedInGuard]
class EmailVerifiedGuard extends AutoRouteGuard {
  final AuthRepository repo;

  EmailVerifiedGuard(this.repo);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO: should I create a separate useCase for isEmailVerified?
    if (repo.isEmailVerified) return resolver.next(true);
    resolver.redirect(const EmailVerificationRoute());
  }
}