import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class DeleteTagUseCase {
  final TagsRepository repo;

  DeleteTagUseCase(this.repo);
  
  Future<void> call(String tagName) async {
    await repo.deleteTag(tagName);
  }
}