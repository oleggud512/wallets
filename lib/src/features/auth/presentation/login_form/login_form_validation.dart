import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../core/common/constants/validation.dart';
import '../../../../core/presentation/localization/locale_keys.g.dart';

abstract interface class Localizable {
  String get localeKey;
}

enum EmailError implements Localizable { 
  invalid(LocaleKeys.emailErrors_invalid),
  notFound(LocaleKeys.emailErrors_notFound);

  @override
  final String localeKey;
  const EmailError(this.localeKey);
}

enum PasswordError implements Localizable {
  incorrect(LocaleKeys.passwordErrors_incorrect),
  invalid(LocaleKeys.passwordErrors_invalid),
  dontMatch(LocaleKeys.passwordErrors_dontMatch);

  @override
  final String localeKey;
  const PasswordError(this.localeKey);
}

class Email extends FormzInput<String, EmailError> with EquatableMixin {
  const Email.dirty({String value = ''}) : super.dirty(value);
  const Email.pure({String value = ''}) : super.pure(value);
  
  @override
  EmailError? validator(String value) {
    if (emailRegex.hasMatch(value)) return null;
    return EmailError.invalid;
  }
  
  @override
  List<Object?> get props => [value];
}

class Password extends FormzInput<String, PasswordError> with EquatableMixin {
  const Password.dirty({String value = '', this.confirmationPassword}) : super.dirty(value);
  const Password.pure({String value = '', this.confirmationPassword}) : super.pure(value);

  final Password? confirmationPassword;
  
  @override
  PasswordError? validator(String value) {
    if (!passwordRegex.hasMatch(value)) return PasswordError.invalid;
    if (confirmationPassword != null && confirmationPassword!.value != value) return PasswordError.dontMatch;
    return null;
  }
  
  @override
  List<Object?> get props => [value, confirmationPassword];
}

