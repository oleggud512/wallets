import 'dart:async';

import 'package:ads_pay_app/src/core/common/firebase_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  final auth = FirebaseAuth.instance;

  @override
  Future<String?> signInWithEmailAndPassword(
                String email, String password) async {
    // authStateCont.sink.add(AuthState.loading);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // authStateCont.sink.add(AuthState.unsignedIn);
      return e.formattedCode;
    }
    return null;
  }

  @override
  Future<String?> registerWithEmailAndPassword(
    String email, 
    String password
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      return e.formattedCode;
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    print('AuthService.signOut()');
    await auth.signOut();
  }

  @override
  Future<void> deleteAccount(String email, String password) async {
    await signInWithEmailAndPassword(email, password);
    await auth.currentUser!.delete();
  }

  @override
  Future<void> sendVerificationEmail() async {
    await auth.currentUser!.sendEmailVerification();
  }

}