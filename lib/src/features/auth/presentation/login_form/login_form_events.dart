import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_events.freezed.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  factory LoginFormEvent() = _LoginFormEvent;
}