import 'package:firebase_auth/firebase_auth.dart';

extension FormatFirebaseAuthExceptionCode on FirebaseAuthException {
  /// makes exception code more 'human readable'
  String get formattedCode {
    return code
      .replaceAll('-', ' ')
      .replaceFirst(code[0], code[0].toUpperCase());
  }
}