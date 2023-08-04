import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';
import 'package:either_dart/either.dart';

@Injectable()
class SignUpWithEmailAndPasswordUseCase {
  final AuthRepository repo;

  SignUpWithEmailAndPasswordUseCase(this.repo);

  Future<Either<FirebaseAuthException, void>> call(String email, String password) async {
    final res = await repo.registerWithEmailAndPassword(email, password);
    return res;
  }
}