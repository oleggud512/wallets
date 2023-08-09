// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryPageState {
  Wallet get wallet => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryPageStateCopyWith<HistoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryPageStateCopyWith<$Res> {
  factory $HistoryPageStateCopyWith(
          HistoryPageState value, $Res Function(HistoryPageState) then) =
      _$HistoryPageStateCopyWithImpl<$Res, HistoryPageState>;
  @useResult
  $Res call({Wallet wallet, List<Tag> tags});
}

/// @nodoc
class _$HistoryPageStateCopyWithImpl<$Res, $Val extends HistoryPageState>
    implements $HistoryPageStateCopyWith<$Res> {
  _$HistoryPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryPageStateCopyWith<$Res>
    implements $HistoryPageStateCopyWith<$Res> {
  factory _$$_HistoryPageStateCopyWith(
          _$_HistoryPageState value, $Res Function(_$_HistoryPageState) then) =
      __$$_HistoryPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Wallet wallet, List<Tag> tags});
}

/// @nodoc
class __$$_HistoryPageStateCopyWithImpl<$Res>
    extends _$HistoryPageStateCopyWithImpl<$Res, _$_HistoryPageState>
    implements _$$_HistoryPageStateCopyWith<$Res> {
  __$$_HistoryPageStateCopyWithImpl(
      _$_HistoryPageState _value, $Res Function(_$_HistoryPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? tags = null,
  }) {
    return _then(_$_HistoryPageState(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$_HistoryPageState implements _HistoryPageState {
  _$_HistoryPageState({required this.wallet, final List<Tag> tags = const []})
      : _tags = tags;

  @override
  final Wallet wallet;
  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'HistoryPageState(wallet: $wallet, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryPageState &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, wallet, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryPageStateCopyWith<_$_HistoryPageState> get copyWith =>
      __$$_HistoryPageStateCopyWithImpl<_$_HistoryPageState>(this, _$identity);
}

abstract class _HistoryPageState implements HistoryPageState {
  factory _HistoryPageState(
      {required final Wallet wallet,
      final List<Tag> tags}) = _$_HistoryPageState;

  @override
  Wallet get wallet;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryPageStateCopyWith<_$_HistoryPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
