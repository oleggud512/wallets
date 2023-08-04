import 'package:ads_pay_app/src/features/auth/presentation/login/login_page_states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_events.freezed.dart';

@freezed
class LoginPageEvent with _$LoginPageEvent {
  factory LoginPageEvent() = _LoginPageEvent;

  factory LoginPageEvent.submit() = LoginPageSubmitEvent;
  factory LoginPageEvent.togglePageMode() = LoginPageTogglePageModeEvent;
  factory LoginPageEvent.exceptionHandled() = LoginPageExceptionHandledEvent;
}