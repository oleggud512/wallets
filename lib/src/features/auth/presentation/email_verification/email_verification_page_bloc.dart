import 'dart:async';

import 'package:ads_pay_app/src/features/auth/application/use_cases/refresh_user_use_case.dart';
import 'package:ads_pay_app/src/features/auth/application/use_cases/send_verification_mail_use_case.dart';
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_out_use_case.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/features/auth/presentation/email_verification/email_verification_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_verification_page_state.dart';

class EmailVerificationPageBloc 
    extends Bloc<EmailVerificationPageEvent, EmailVerificationPageState> {
  final SendVerificationMailUseCase sendMail;
  final SignOutUseCase signOut;
  final RefreshUserUseCase refresh;
  final AuthRepository repo;

  Timer? ticker;

  EmailVerificationPageBloc(
    this.sendMail, 
    this.signOut, 
    this.refresh, 
    this.repo
  ) : super(EmailVerificationPageState.awaiting) {

    on<EmailVerificationPageSendEmailEvent>((event, emit) async { // TODO: should not be called twice... it's bad... 
      await sendMail();
      emit(EmailVerificationPageState.awaiting);
    });

    on<EmailVerificationPageCancelVerificationEvent>((event, emit) async {
      await signOut();
      emit(EmailVerificationPageState.cancelled);
    });

    on<EmailVerificationPageCheckVerifiedEvent>((event, emit) async {
      await refresh();
      emit(repo.isEmailVerified // TODO: should I create a separate useCase for isEmailVerified? Or better create something like `class VerificationFacade { get isEmailVerified, get isSignedIn }`?
        ? EmailVerificationPageState.success 
        : EmailVerificationPageState.awaiting);
    });
  }

}