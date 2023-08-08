import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_events.freezed.dart';

@freezed
class LoginPageEvent with _$LoginPageEvent {
  factory LoginPageEvent() = _LoginPageEvent;

  factory LoginPageEvent.submit(VoidCallback onSuccess) = LoginPageSubmitEvent;
  factory LoginPageEvent.togglePageMode() = LoginPageTogglePageModeEvent;
  factory LoginPageEvent.exceptionHandled() = LoginPageExceptionHandledEvent;
}