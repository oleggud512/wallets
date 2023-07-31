import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCurUserUidUseCase {
  final AuthRepository repo;

  GetCurUserUidUseCase(this.repo);

  String? call() {
    return repo.currentUser?.uid;
  }
}