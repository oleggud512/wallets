import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_list_events.freezed.dart';

@freezed
class TagListEvent with _$TagListEvent {
  factory TagListEvent() = _TagListEvent;

  factory TagListEvent.load() = TagListLoadEvent;
  factory TagListEvent.nameChanged(String name) = TagListNameChangedEvent;
  factory TagListEvent.colorChanged(Color color) = TagListColorChangedEvent;
  factory TagListEvent.addTag([VoidCallback? onAdded]) = TagListAddTagEvent;
  factory TagListEvent.deleteTag(String name) = TagListDeleteTagEvent;
}