import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/common/constants/constants.dart';
import '../../../core/presentation/loading_dialog.dart';

enum LoginAction { newUser, deleteUser }

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    this.action=LoginAction.newUser
  }) : super(key: key);

  final LoginAction action;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  AuthRepository authRepo = getIt<AuthRepository>();

  bool isSignIn = true;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: InkWell(
          onTap: () {
            focus1.unfocus();
            focus2.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    SvgPicture.asset('assets/wallet1.svg'.hardcoded,
                      height: p72,
                      width: p72,
                    ),
                    h32gap,
                    TextField(
                      focusNode: focus1,
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'email'.hardcoded,
                      ),
                    ),
                    h16gap,
                    TextField(
                      focusNode: focus2,
                      controller: password,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        labelText: 'password'.hardcoded,
                        suffixIcon: IconButton(
                          icon: Icon(obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() { 
                              obscureText = !obscureText; 
                            });
                          },
                        )
                      ),
                    ),
                    h16gap,
                    ElevatedButton(
                      onPressed: onSignIn,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(56),
                      ),
                      child: Text(
                        widget.action == LoginAction.deleteUser
                          ? 'Delete User'.hardcoded
                          : isSignIn
                            ? 'Sign In'.hardcoded
                            : 'Register'.hardcoded,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        )
                      )
                    ),
                    const Spacer(),
                    if (widget.action == LoginAction.newUser) Padding(
                      padding: const EdgeInsets.all(16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: isSignIn 
                            ? 'Don\'t have an account yet? '.hardcoded 
                            : 'Have an account? '.hardcoded,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                          children: [
                            TextSpan(
                              text: isSignIn 
                                ? 'Register'.hardcoded 
                                : 'Sign In'.hardcoded,
                              recognizer: TapGestureRecognizer()..onTap = () {
                                setState(() {
                                  isSignIn = !isSignIn;
                                });
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
          ),
        ),
      ),
    );
  }

  Future<void> onSignIn() async {
    String? message;
    if (widget.action == LoginAction.deleteUser) {
      await authRepo.deleteAccount(email.text, password.text);
      if (mounted) {
        // Navigator.pop(context); // потому что если срабатывает этот блок то только после того как его запушили,
        //                         // поэтому мы должны вернуться к главному рауту.
        message = 'Account successfully deleted'.hardcoded;
      }
    }
    else if (isSignIn) {
      message = await LoadingDialog(
        task: authRepo.signInWithEmailAndPassword(email.text, password.text)
      ).show(context);

    } else {
      message = await LoadingDialog(
        task: authRepo.registerWithEmailAndPassword(email.text, password.text)
      ).show(context);
    }
    if (mounted && message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        )
      );
    }
    if (mounted) AutoRouter.of(context).replaceAll([const WalletsRoute()]); // тогда, если просто входишь, то тебя оставит на WalletsPage, а если регистрируешься, то перекинет на верификацию.
  }
}