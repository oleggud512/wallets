import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_states.freezed.dart';

enum LoginPageMode { signIn, singUp }

@freezed
class LoginPageState with _$LoginPageState {
  factory LoginPageState({
    @Default(LoginPageMode.signIn) LoginPageMode pageMode,
    @Default(false) isLoading,
    FirebaseAuthException? authException
  }) = _LoginPageState;
}

extension LoginPageStateGetters on LoginPageState {
  bool get isSignIn => pageMode == LoginPageMode.signIn;
  bool get isSignUp => pageMode == LoginPageMode.singUp;
}