import '../entities/tag.dart';

abstract interface class TagsRepository {
  Stream<List<Tag>> watchTags();
  Future<void> addTag(Tag tag);
  Future<void> deleteTag(String name);
}