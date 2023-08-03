// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormState {
  LoginFormError? get emailError => throw _privateConstructorUsedError;
  LoginFormError? get passwordError => throw _privateConstructorUsedError;
  LoginFormError? get confirmPasswordError =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call(
      {LoginFormError? emailError,
      LoginFormError? passwordError,
      LoginFormError? confirmPasswordError});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
  }) {
    return _then(_value.copyWith(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as LoginFormError?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as LoginFormError?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as LoginFormError?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginFormStateCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$_LoginFormStateCopyWith(
          _$_LoginFormState value, $Res Function(_$_LoginFormState) then) =
      __$$_LoginFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginFormError? emailError,
      LoginFormError? passwordError,
      LoginFormError? confirmPasswordError});
}

/// @nodoc
class __$$_LoginFormStateCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$_LoginFormState>
    implements _$$_LoginFormStateCopyWith<$Res> {
  __$$_LoginFormStateCopyWithImpl(
      _$_LoginFormState _value, $Res Function(_$_LoginFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
  }) {
    return _then(_$_LoginFormState(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as LoginFormError?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as LoginFormError?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as LoginFormError?,
    ));
  }
}

/// @nodoc

class _$_LoginFormState implements _LoginFormState {
  _$_LoginFormState(
      {this.emailError, this.passwordError, this.confirmPasswordError});

  @override
  final LoginFormError? emailError;
  @override
  final LoginFormError? passwordError;
  @override
  final LoginFormError? confirmPasswordError;

  @override
  String toString() {
    return 'LoginFormState(emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFormState &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailError, passwordError, confirmPasswordError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      __$$_LoginFormStateCopyWithImpl<_$_LoginFormState>(this, _$identity);
}

abstract class _LoginFormState implements LoginFormState {
  factory _LoginFormState(
      {final LoginFormError? emailError,
      final LoginFormError? passwordError,
      final LoginFormError? confirmPasswordError}) = _$_LoginFormState;

  @override
  LoginFormError? get emailError;
  @override
  LoginFormError? get passwordError;
  @override
  LoginFormError? get confirmPasswordError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
