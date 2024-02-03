import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/features/auth/domain/entities/app_user.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCurrentUserUseCase {
  final AuthRepository repo;

  GetCurrentUserUseCase(this.repo);

  AppUser? call() {
    return repo.currentUser;
  }
}