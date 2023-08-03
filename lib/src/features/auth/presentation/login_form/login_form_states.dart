import 'package:freezed_annotation/freezed_annotation.dart';

import 'login_form_errors.dart';

part 'login_form_states.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  factory LoginFormState({
    LoginFormError? emailError,
    LoginFormError? passwordError,
    LoginFormError? confirmPasswordError
  }) = _LoginFormState;
}