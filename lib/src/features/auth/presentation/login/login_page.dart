import 'package:ads_pay_app/src/core/common/extensions/build_context.dart';
import 'package:ads_pay_app/src/core/common/extensions/firebase.dart';
import 'package:ads_pay_app/src/core/common/extensions/string.dart';
import 'package:ads_pay_app/src/core/common/logger.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login/login_page_events.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_bloc.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_widget.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/wallets/wallets_page_bloc.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../../../core/common/constants/sizes.dart';
import '../../../../core/presentation/loading_dialog.dart';
import '../../../../core/presentation/localization/locale_keys.g.dart';
import 'login_page_bloc.dart';
import 'login_page_states.dart';


@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final focus1 = FocusNode();
  final focus2 = FocusNode();

  final loginFormWidgetKey = GlobalKey<LoginFormWidgetState>();

  AuthRepository authRepo = getIt<AuthRepository>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: InkWell(
          onTap: () {
            focus1.unfocus();
            focus2.unfocus();
          },
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => LoginFormBloc()),
              BlocProvider(create: (context) => LoginPageBloc(
                context.read<LoginFormBloc>(), 
                getIt(), 
                getIt()
              )),
            ],
            child: BlocConsumer<LoginPageBloc, LoginPageState>(
              listener: (context, state) {
                if (state.authException == null) return;
                context.showSnackBar(context.tr('${LocaleKeys.firebaseExceptions}.${state.authException!.localeKey}'));
                context.read<LoginPageBloc>().add(LoginPageExceptionHandledEvent());
              },
              builder: (context, state) {
                final bloc = context.watch<LoginPageBloc>();
                return Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: Stack(
                    children: [
                      if (state.isLoading) const LinearProgressIndicator(),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: p8),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: p400,
                          ),
                          child: ListView(
                            children: [
                              h32gap,
                              Text(context.tr(LocaleKeys.wallets), 
                                style: context.textTheme!.displaySmall, 
                                textAlign: TextAlign.center,
                              ),
                              h32gap,
                              Padding(
                                padding: const EdgeInsets.only(left: 10), // TODO: make wallet1.svg symmetric
                                child: SvgPicture.asset('assets/wallet1.svg'.hardcoded,
                                  height: p72,
                                  width: p72,
                                ),
                              ),
                              h32gap,
                              LoginFormWidget(confirmPassword: state.isSignUp),
                              h16gap,
                              FilledButton(
                                onPressed: () {
                                  bloc.add(LoginPageSubmitEvent(() {
                                    AutoRouter.of(context).replaceAll([const WalletsRoute()]);
                                  }));
                                },
                                style: FilledButton.styleFrom(
                                  fixedSize: const Size.fromHeight(56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(p8)
                                  )
                                ),
                                child: Text(
                                  state.isSignIn
                                    ? 'Sign In'.hardcoded
                                    : 'Register'.hardcoded,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                  )
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(p16),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: state.isSignIn 
                                      ? 'Don\'t have an account yet? '.hardcoded 
                                      : 'Have an account? '.hardcoded,
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSurface
                                    ),
                                    children: [
                                      TextSpan(
                                        text: state.isSignIn 
                                          ? 'Register'.hardcoded 
                                          : 'Sign In'.hardcoded,
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          bloc.add(LoginPageTogglePageModeEvent());
                                        },
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.primary
                                        )
                                      )
                                    ]
                                  )
                                ),
                              )
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSubmit() async {
    // String? message;
    // if (widget.action == LoginAction.deleteUser) {
    //   await authRepo.deleteAccount(email.text, password.text);
    //   if (mounted) {
    //     // Navigator.pop(context); // потому что если срабатывает этот блок то только после того как его запушили,
    //     //                         // поэтому мы должны вернуться к главному рауту.
    //     message = 'Account successfully deleted'.hardcoded;
    //   }
    // }
    // else if (isSignIn) {
    //   message = await LoadingDialog(
    //     task: authRepo.signInWithEmailAndPassword(email.text, password.text)
    //   ).show(context);

    // } else {
    //   message = await LoadingDialog(
    //     task: authRepo.registerWithEmailAndPassword(email.text, password.text)
    //   ).show(context);
    // }

    // if (mounted && message != null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //     )
    //   );
    // }
    // if (mounted) AutoRouter.of(context).replaceAll([const WalletsRoute()]); // тогда, если просто входишь, то тебя оставит на WalletsPage, а если регистрируешься, то перекинет на верификацию.
  }
}