import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'login_form_validation.dart';

class LoginFormState extends Equatable with FormzMixin {
  final Email email;
  final Password password;
  final EmailError? emailError;
  final PasswordError? passwordError;

  const LoginFormState({
    this.email = const Email.pure(), 
    this.password = const Password.pure(), 
    this.emailError, 
    this.passwordError
  });

  LoginFormState copyWith({
    Email? email,
    Password? password,
    EmailError? emailError,
    PasswordError? passwordError,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError
    );
  }
  
  @override
  List<Object?> get props => [email, password, emailError, passwordError];
  
  @override
  List<FormzInput> get inputs => [email, password];
}

// extension PasswordMatch on LoginFormState {
//   PasswordError? get passwordMatchError => 
//     password.value == confirmPassword.value ? null : PasswordError.dontMatch;
// }