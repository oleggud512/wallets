// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_page_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionPageState {
  Tag? get tag => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionPageStateCopyWith<TransactionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPageStateCopyWith<$Res> {
  factory $TransactionPageStateCopyWith(TransactionPageState value,
          $Res Function(TransactionPageState) then) =
      _$TransactionPageStateCopyWithImpl<$Res, TransactionPageState>;
  @useResult
  $Res call({Tag? tag, double amount, String description});

  $TagCopyWith<$Res>? get tag;
}

/// @nodoc
class _$TransactionPageStateCopyWithImpl<$Res,
        $Val extends TransactionPageState>
    implements $TransactionPageStateCopyWith<$Res> {
  _$TransactionPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? amount = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TagCopyWith<$Res>? get tag {
    if (_value.tag == null) {
      return null;
    }

    return $TagCopyWith<$Res>(_value.tag!, (value) {
      return _then(_value.copyWith(tag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionPageStateImplCopyWith<$Res>
    implements $TransactionPageStateCopyWith<$Res> {
  factory _$$TransactionPageStateImplCopyWith(_$TransactionPageStateImpl value,
          $Res Function(_$TransactionPageStateImpl) then) =
      __$$TransactionPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tag? tag, double amount, String description});

  @override
  $TagCopyWith<$Res>? get tag;
}

/// @nodoc
class __$$TransactionPageStateImplCopyWithImpl<$Res>
    extends _$TransactionPageStateCopyWithImpl<$Res, _$TransactionPageStateImpl>
    implements _$$TransactionPageStateImplCopyWith<$Res> {
  __$$TransactionPageStateImplCopyWithImpl(_$TransactionPageStateImpl _value,
      $Res Function(_$TransactionPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? amount = null,
    Object? description = null,
  }) {
    return _then(_$TransactionPageStateImpl(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionPageStateImpl implements _TransactionPageState {
  _$TransactionPageStateImpl(
      {this.tag, this.amount = 0, this.description = ''});

  @override
  final Tag? tag;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'TransactionPageState(tag: $tag, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionPageStateImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag, amount, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionPageStateImplCopyWith<_$TransactionPageStateImpl>
      get copyWith =>
          __$$TransactionPageStateImplCopyWithImpl<_$TransactionPageStateImpl>(
              this, _$identity);
}

abstract class _TransactionPageState implements TransactionPageState {
  factory _TransactionPageState(
      {final Tag? tag,
      final double amount,
      final String description}) = _$TransactionPageStateImpl;

  @override
  Tag? get tag;
  @override
  double get amount;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$TransactionPageStateImplCopyWith<_$TransactionPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
