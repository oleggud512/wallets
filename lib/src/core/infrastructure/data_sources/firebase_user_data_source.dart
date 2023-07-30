import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../../features/auth/application/use_cases/get_cur_user_uid_use_case.dart';
import '../../common/constants/strings.dart';

@Singleton()
class FirebaseUserDataSource {
  FirebaseUserDataSource(this.getCurUserUidUseCase);

  final GetCurUserUidUseCase getCurUserUidUseCase;

  final FirebaseDatabase db = FirebaseDatabase.instance;
  DatabaseReference get userRef => db.ref(
    FirebaseStrings.account(getCurUserUidUseCase() ?? ''));
}