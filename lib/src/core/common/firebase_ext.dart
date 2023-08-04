import 'package:ads_pay_app/src/core/common/string_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FormatFirebaseAuthExceptionCode on FirebaseAuthException {
  /// makes exception code more 'human readable'
  String get formattedCode {
    return code
      .replaceAll('-', ' ')
      .replaceFirst(code[0], code[0].toUpperCase());
  }


  // TODO: create custom LocaleKeys builder
  String get localeKey {
    final c =  code.split('-')
      .map((w) => w.capitalize())
      .join('');
    return c.replaceRange(0, 1, c[0].toLowerCase());
  }
}