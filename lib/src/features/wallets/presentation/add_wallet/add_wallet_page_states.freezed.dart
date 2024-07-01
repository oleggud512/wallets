// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_wallet_page_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddWalletPageState {
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddWalletPageStateCopyWith<AddWalletPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWalletPageStateCopyWith<$Res> {
  factory $AddWalletPageStateCopyWith(
          AddWalletPageState value, $Res Function(AddWalletPageState) then) =
      _$AddWalletPageStateCopyWithImpl<$Res, AddWalletPageState>;
  @useResult
  $Res call({String description, String currency, double amount});
}

/// @nodoc
class _$AddWalletPageStateCopyWithImpl<$Res, $Val extends AddWalletPageState>
    implements $AddWalletPageStateCopyWith<$Res> {
  _$AddWalletPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? currency = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddWalletPageStateImplCopyWith<$Res>
    implements $AddWalletPageStateCopyWith<$Res> {
  factory _$$AddWalletPageStateImplCopyWith(_$AddWalletPageStateImpl value,
          $Res Function(_$AddWalletPageStateImpl) then) =
      __$$AddWalletPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String currency, double amount});
}

/// @nodoc
class __$$AddWalletPageStateImplCopyWithImpl<$Res>
    extends _$AddWalletPageStateCopyWithImpl<$Res, _$AddWalletPageStateImpl>
    implements _$$AddWalletPageStateImplCopyWith<$Res> {
  __$$AddWalletPageStateImplCopyWithImpl(_$AddWalletPageStateImpl _value,
      $Res Function(_$AddWalletPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? currency = null,
    Object? amount = null,
  }) {
    return _then(_$AddWalletPageStateImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AddWalletPageStateImpl implements _AddWalletPageState {
  _$AddWalletPageStateImpl(
      {this.description = '', this.currency = '', this.amount = 0});

  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'AddWalletPageState(description: $description, currency: $currency, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWalletPageStateImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, currency, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWalletPageStateImplCopyWith<_$AddWalletPageStateImpl> get copyWith =>
      __$$AddWalletPageStateImplCopyWithImpl<_$AddWalletPageStateImpl>(
          this, _$identity);
}

abstract class _AddWalletPageState implements AddWalletPageState {
  factory _AddWalletPageState(
      {final String description,
      final String currency,
      final double amount}) = _$AddWalletPageStateImpl;

  @override
  String get description;
  @override
  String get currency;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$AddWalletPageStateImplCopyWith<_$AddWalletPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
