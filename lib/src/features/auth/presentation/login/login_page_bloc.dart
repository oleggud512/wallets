import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_in_with_email_and_password_use_case.dart';
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_up_with_email_and_password_use_case.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login/login_page_events.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login/login_page_states.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_bloc.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final LoginFormBloc _loginFormBloc;
  final SignInWithEmailAndPasswordUseCase signIn;
  final SignUpWithEmailAndPasswordUseCase signUp;
  
  LoginPageBloc(
    LoginFormBloc loginFormBloc, 
    this.signIn, 
    this.signUp
  ) : _loginFormBloc = loginFormBloc, super(LoginPageState()) {

    on<LoginPageTogglePageModeEvent>((event, emit) {
      emit(state.copyWith(pageMode: state.pageMode == LoginPageMode.signIn 
        ? LoginPageMode.singUp 
        : LoginPageMode.signIn
      ));

      _loginFormBloc.add(LoginFormSetConfirmPasswordEvent(state.isSignUp));
    });

    on<LoginPageSubmitEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      
      if (!_loginFormBloc.state.isValid) return;
      
      final res = state.isSignIn
        ? await signIn(_loginFormBloc.state.email.value, _loginFormBloc.state.password.value)
        : await signUp(_loginFormBloc.state.email.value, _loginFormBloc.state.password.value);
      
      res.fold(
        (left) => emit(state.copyWith(isLoading: false, authException: left)), // TODO: Shouldn't it throw an exception extending Localizable? Because PasswordError and EmailError are both extend it.
        (right) {
          event.onSuccess();
          emit(state.copyWith(isLoading: false));
        }
      );
    });

    on<LoginPageExceptionHandledEvent>((event, emit) {
      emit(state.copyWith(authException: null));
    });
  }
}