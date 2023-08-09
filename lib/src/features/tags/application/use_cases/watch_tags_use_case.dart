import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/tag.dart';


@Injectable()
class WatchTagsUseCase {
  final TagsRepository repo;

  WatchTagsUseCase(this.repo);

  Stream<List<Tag>> call() {
    return repo.watchTags();
  }
}