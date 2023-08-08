import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../../features/auth/application/use_cases/get_current_user_use_case.dart';
import '../../common/constants/strings.dart';

@Singleton()
class FirebaseUserDataSource {
  FirebaseUserDataSource(this.getCurrentUser);
  
  final GetCurrentUserUseCase getCurrentUser;
  final FirebaseDatabase db = FirebaseDatabase.instance;

  String get uid => getCurrentUser()?.uid ?? '';

  DatabaseReference get userRef => db
    .ref(FirebaseStrings.accounts)
    .child(uid);
}