import 'package:ads_pay_app/src/core/infrastructure/data_sources/firebase_user_data_source.dart';
import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/features/tags/domain/repositories/tags_repository.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/application/errors/exceptions.dart';
import '../../../../core/common/constants/strings.dart';

@Singleton(as: TagsRepository)
class FirebaseTagsRepositoryImpl implements TagsRepository {
  FirebaseTagsRepositoryImpl(this.source);

  FirebaseUserDataSource source;

  @override
  Future<void> addTag(Tag tag) {
    return source.userRef
      .child(FirebaseStrings.tag(tag.name))
      .update(tag.toJson());
  }

  @override
  Future<void> deleteTag(String name) {
    return source.userRef.child(FirebaseStrings.tag(name)).remove();
  }

  @override
  Stream<List<Tag>> watchTags() {
    return source.userRef.child(FirebaseStrings.tags).onValue.map(
      (event) => event.snapshot.children.map(Tag.fromDataSnapshot).toList()
    );
  }

  @override
  Future<Either<AppException, Tag>> fetchTag(String name) async {
    try {
      final tagSnapshot = await source.userRef
        .child(FirebaseStrings.tags)
        .child(name)
        .get();
      
      final tag = Tag.fromDataSnapshot(tagSnapshot);
      return Right(tag);
    } catch (e) {
      return Left(AppException(error: e));
    }
  }
  
}