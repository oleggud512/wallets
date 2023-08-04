import 'dart:async';

import 'package:ads_pay_app/src/core/common/logger.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_states.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form_events.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    
    on<LoginFormAddPasswordErrorEvent>((event, emit) {
      emit(state.copyWith(passwordError: event.error));
    });

    on<LoginFormAddEmailErrorEvent>((event, emit) {
      emit(state.copyWith(emailError: event.error));
    });


    on<LoginFormSetConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(
        password: Password.dirty(
          value: state.password.value,
          confirmationPassword: event.isConfirmPassword 
            ? const Password.dirty() 
            : null
        )
      ));
    });


    on<LoginFormEmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: Email.dirty(value: event.email)));
    });

    on<LoginFormPasswordChangedEvent>((event, emit) {
      emit(state.copyWith(
        password: Password.dirty(
          value: event.password, 
          confirmationPassword: state.password.confirmationPassword
        )
      ));
    });

    on<LoginFormConfirmPasswordChangedEvent>((event, emit) {
      emit(state.copyWith(
        password: Password.dirty(
          value: state.password.value,
          confirmationPassword: Password.dirty(value: event.confirmPassword)
        )
      ));
    });

  }

}