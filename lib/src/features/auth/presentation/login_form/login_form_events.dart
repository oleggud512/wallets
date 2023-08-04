import 'package:freezed_annotation/freezed_annotation.dart';
import 'login_form_validation.dart';

part 'login_form_events.freezed.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  factory LoginFormEvent() = _LoginFormEvent;

  factory LoginFormEvent.addPasswordError(PasswordError error) = LoginFormAddPasswordErrorEvent;
  factory LoginFormEvent.addEmailError(EmailError error) = LoginFormAddEmailErrorEvent;
  factory LoginFormEvent.emailChanged(String email) = LoginFormEmailChangedEvent;
  factory LoginFormEvent.passwordChanged(String password) = LoginFormPasswordChangedEvent;
  factory LoginFormEvent.confirmPasswordChanged(String confirmPassword) = LoginFormConfirmPasswordChangedEvent;
  factory LoginFormEvent.reset() = LoginFormResetEvent;
  factory LoginFormEvent.setConfirmPassword(bool isConfirmPassword) = LoginFormSetConfirmPasswordEvent;
}