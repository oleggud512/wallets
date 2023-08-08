import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_events.freezed.dart';

@freezed
class EmailVerificationPageEvent with _$EmailVerificationPageEvent {
  factory EmailVerificationPageEvent() = _EmailVerificationPageEvent;

  factory EmailVerificationPageEvent.sendEmail() = 
    EmailVerificationPageSendEmailEvent;
  factory EmailVerificationPageEvent.cancelVerification() = 
    EmailVerificationPageCancelVerificationEvent;
  factory EmailVerificationPageEvent.checkVerified() =
    EmailVerificationPageCheckVerifiedEvent;
}