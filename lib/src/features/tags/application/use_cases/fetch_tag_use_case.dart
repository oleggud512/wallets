import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/application/errors/exceptions.dart';
import '../../domain/entities/tag.dart';


@Injectable()
class FetchTagUseCase {
  final TagsRepository repo;

  FetchTagUseCase(this.repo);
  
  Future<Either<AppException, Tag>> call(String name) async {
    final res = await repo.fetchTag(name);
    return res;
  }
}