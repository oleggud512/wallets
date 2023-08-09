import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/tag.dart';

part 'tag_list_states.freezed.dart';

@freezed
class TagListState with _$TagListState {
  factory TagListState({
    @Default([]) List<Tag> tags,
    @Default('') String newTagName,
    @Default(Colors.grey) Color newTagColor,
  }) = _TagListState;
}