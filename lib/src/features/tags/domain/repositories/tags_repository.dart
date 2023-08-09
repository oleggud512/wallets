import 'package:either_dart/either.dart';

import '../../../../core/application/errors/exceptions.dart';
import '../entities/tag.dart';

abstract interface class TagsRepository {
  Stream<List<Tag>> watchTags();
  Future<void> addTag(Tag tag);
  Future<void> deleteTag(String name);
  Future<Either<AppException, Tag>> fetchTag(String name);
}