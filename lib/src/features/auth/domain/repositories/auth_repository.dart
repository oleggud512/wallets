import 'package:ads_pay_app/src/features/auth/domain/entities/app_user.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Future<Either<FirebaseAuthException, void>> signInWithEmailAndPassword(String email, String password);
  Future<Either<FirebaseAuthException, void>> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> deleteAccount(String email, String password);
  Future<void> sendVerificationEmail();
  AppUser? get currentUser;
  bool get isSignedIn;
  bool get isEmailVerified;
  Future<void> refreshUser();
}