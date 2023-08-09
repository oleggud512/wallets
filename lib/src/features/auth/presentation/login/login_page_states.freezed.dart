// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginPageState {
  LoginPageMode get pageMode => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;
  FirebaseAuthException? get authException =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;
  @useResult
  $Res call(
      {LoginPageMode pageMode,
      dynamic isLoading,
      FirebaseAuthException? authException});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageMode = null,
    Object? isLoading = freezed,
    Object? authException = freezed,
  }) {
    return _then(_value.copyWith(
      pageMode: null == pageMode
          ? _value.pageMode
          : pageMode // ignore: cast_nullable_to_non_nullable
              as LoginPageMode,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      authException: freezed == authException
          ? _value.authException
          : authException // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginPageStateCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$_LoginPageStateCopyWith(
          _$_LoginPageState value, $Res Function(_$_LoginPageState) then) =
      __$$_LoginPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginPageMode pageMode,
      dynamic isLoading,
      FirebaseAuthException? authException});
}

/// @nodoc
class __$$_LoginPageStateCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$_LoginPageState>
    implements _$$_LoginPageStateCopyWith<$Res> {
  __$$_LoginPageStateCopyWithImpl(
      _$_LoginPageState _value, $Res Function(_$_LoginPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageMode = null,
    Object? isLoading = freezed,
    Object? authException = freezed,
  }) {
    return _then(_$_LoginPageState(
      pageMode: null == pageMode
          ? _value.pageMode
          : pageMode // ignore: cast_nullable_to_non_nullable
              as LoginPageMode,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
      authException: freezed == authException
          ? _value.authException
          : authException // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
    ));
  }
}

/// @nodoc

class _$_LoginPageState implements _LoginPageState {
  _$_LoginPageState(
      {this.pageMode = LoginPageMode.signIn,
      this.isLoading = false,
      this.authException});

  @override
  @JsonKey()
  final LoginPageMode pageMode;
  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  final FirebaseAuthException? authException;

  @override
  String toString() {
    return 'LoginPageState(pageMode: $pageMode, isLoading: $isLoading, authException: $authException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginPageState &&
            (identical(other.pageMode, pageMode) ||
                other.pageMode == pageMode) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            (identical(other.authException, authException) ||
                other.authException == authException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageMode,
      const DeepCollectionEquality().hash(isLoading), authException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginPageStateCopyWith<_$_LoginPageState> get copyWith =>
      __$$_LoginPageStateCopyWithImpl<_$_LoginPageState>(this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  factory _LoginPageState(
      {final LoginPageMode pageMode,
      final dynamic isLoading,
      final FirebaseAuthException? authException}) = _$_LoginPageState;

  @override
  LoginPageMode get pageMode;
  @override
  dynamic get isLoading;
  @override
  FirebaseAuthException? get authException;
  @override
  @JsonKey(ignore: true)
  _$$_LoginPageStateCopyWith<_$_LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
