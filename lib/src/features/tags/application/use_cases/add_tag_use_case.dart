import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class AddTagUseCase {
  final TagsRepository repo;

  AddTagUseCase(this.repo);
  
  Future<void> call({
    required WalletAction action, 
    required String name, 
    required Color color
  }) async {
    await repo.addTag(Tag(action: action, name: name, color: color));  
  }
}