import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form_events.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(LoginFormState()) {

  }
}