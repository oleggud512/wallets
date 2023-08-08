import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class SendVerificationMailUseCase {
  final AuthRepository repo;

  SendVerificationMailUseCase(this.repo);
  
  Future<void> call() async {
    await repo.sendVerificationEmail();
  }
}