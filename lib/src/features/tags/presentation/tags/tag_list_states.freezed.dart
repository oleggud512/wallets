// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_list_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagListState {
  List<Tag> get tags => throw _privateConstructorUsedError;
  String get newTagName => throw _privateConstructorUsedError;
  Color get newTagColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagListStateCopyWith<TagListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagListStateCopyWith<$Res> {
  factory $TagListStateCopyWith(
          TagListState value, $Res Function(TagListState) then) =
      _$TagListStateCopyWithImpl<$Res, TagListState>;
  @useResult
  $Res call({List<Tag> tags, String newTagName, Color newTagColor});
}

/// @nodoc
class _$TagListStateCopyWithImpl<$Res, $Val extends TagListState>
    implements $TagListStateCopyWith<$Res> {
  _$TagListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? newTagName = null,
    Object? newTagColor = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      newTagName: null == newTagName
          ? _value.newTagName
          : newTagName // ignore: cast_nullable_to_non_nullable
              as String,
      newTagColor: null == newTagColor
          ? _value.newTagColor
          : newTagColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagListStateCopyWith<$Res>
    implements $TagListStateCopyWith<$Res> {
  factory _$$_TagListStateCopyWith(
          _$_TagListState value, $Res Function(_$_TagListState) then) =
      __$$_TagListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag> tags, String newTagName, Color newTagColor});
}

/// @nodoc
class __$$_TagListStateCopyWithImpl<$Res>
    extends _$TagListStateCopyWithImpl<$Res, _$_TagListState>
    implements _$$_TagListStateCopyWith<$Res> {
  __$$_TagListStateCopyWithImpl(
      _$_TagListState _value, $Res Function(_$_TagListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? newTagName = null,
    Object? newTagColor = null,
  }) {
    return _then(_$_TagListState(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      newTagName: null == newTagName
          ? _value.newTagName
          : newTagName // ignore: cast_nullable_to_non_nullable
              as String,
      newTagColor: null == newTagColor
          ? _value.newTagColor
          : newTagColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_TagListState implements _TagListState {
  _$_TagListState(
      {final List<Tag> tags = const [],
      this.newTagName = '',
      this.newTagColor = Colors.grey})
      : _tags = tags;

  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final String newTagName;
  @override
  @JsonKey()
  final Color newTagColor;

  @override
  String toString() {
    return 'TagListState(tags: $tags, newTagName: $newTagName, newTagColor: $newTagColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagListState &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.newTagName, newTagName) ||
                other.newTagName == newTagName) &&
            (identical(other.newTagColor, newTagColor) ||
                other.newTagColor == newTagColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tags), newTagName, newTagColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagListStateCopyWith<_$_TagListState> get copyWith =>
      __$$_TagListStateCopyWithImpl<_$_TagListState>(this, _$identity);
}

abstract class _TagListState implements TagListState {
  factory _TagListState(
      {final List<Tag> tags,
      final String newTagName,
      final Color newTagColor}) = _$_TagListState;

  @override
  List<Tag> get tags;
  @override
  String get newTagName;
  @override
  Color get newTagColor;
  @override
  @JsonKey(ignore: true)
  _$$_TagListStateCopyWith<_$_TagListState> get copyWith =>
      throw _privateConstructorUsedError;
}
