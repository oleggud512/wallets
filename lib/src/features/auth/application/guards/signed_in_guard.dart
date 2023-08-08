import 'package:auto_route/auto_route.dart';

import '../../../../router.dart';
import '../../domain/repositories/auth_repository.dart';

/// Checks if the user is signed in.
/// Redirects to the login page if he isn't. 
class SignedInGuard extends AutoRouteGuard {
  final AuthRepository repo;

  SignedInGuard(this.repo);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (repo.isSignedIn) return resolver.next(true);
    resolver.redirect(const LoginRoute());
  }
}