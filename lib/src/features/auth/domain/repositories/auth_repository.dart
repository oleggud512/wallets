import 'package:ads_pay_app/src/features/auth/domain/repositories/entities/app_user.dart';

abstract interface class AuthRepository {
  Future<String?> signInWithEmailAndPassword(String email, String password);
  Future<String?> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> deleteAccount(String email, String password);
  Future<void> sendVerificationEmail();
  AppUser? get currentUser;
  bool get isSignedIn;
  bool get isEmailVerified;
  Future<void> refreshUser();
}