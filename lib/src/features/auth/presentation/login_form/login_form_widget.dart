
import 'package:ads_pay_app/src/core/common/constants/validation.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_bloc.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';



import '../../../../core/common/constants/sizes.dart';
import 'login_form_states.dart';


class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
    this.confirmPassword = false
  });

  final bool confirmPassword;

  @override
  State<LoginFormWidget> createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ({String email, String password}) getFormData() { 
    if (_formKey.currentState?.validate() != true) throw LoginFormError(); 
    return (email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                validator: (v) {
                  if (!emailRegex.hasMatch(v!)) return 'Incorrect email'.hardcoded;
                  if (state.emailError != null) return state.emailError.toString();
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email'.hardcoded
                ),
              ),
              h16gap,
              TextFormField(
                controller: _password,
                validator: (v) {
                  if (!passwordRegex.hasMatch(v!)) return 'Password too short'.hardcoded;
                  if (widget.confirmPassword && v != _confirmPassword.text) return 'Passwords don\'t match'.hardcoded;
                  if (state.passwordError != null) return state.passwordError.toString(); // сюда может попасть IncorrectPassword
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password'.hardcoded
                ),
              ),
              if (widget.confirmPassword) ...[h16gap, TextFormField(
                controller: _confirmPassword,
                validator: (v) {
                  if (!passwordRegex.hasMatch(v!)) return 'Password too short'.hardcoded;
                  if (widget.confirmPassword && v != _confirmPassword.text) return 'Passwords don\'t match'.hardcoded;
                  if (state.confirmPasswordError != null) return state.confirmPasswordError.toString();
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Confirm password'.hardcoded
                ),
              )]
            ],
          ),
        );
      }
    );
  }
}

enum EmEx { incorrect }

class Email extends FormzInput<String, EmEx> {
  const Email.dirty([super.value = '']) : super.dirty();
  const Email.pure([super.value = '']) : super.pure();
  
  @override
  EmEx? validator(String value) {
    // if (!emailRegex.hasMatch(v!)) return 'Incorrect email'.hardcoded;
    // if (state.emailError != null) return state.emailError.toString();
    // return null;

  }
}