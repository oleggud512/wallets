import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class DeleteAccountUseCase {
  final AuthRepository repo;

  DeleteAccountUseCase(this.repo);
  
  Future<Either<Object, void>> call(String email, String password) async {
    try {
      await repo.deleteAccount(email, password);
      return const Right(null);
    } catch (e) {
      return Left(e);
    }
  }
}