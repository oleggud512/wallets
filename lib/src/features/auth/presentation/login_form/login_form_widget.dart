
import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_bloc.dart';
import 'package:ads_pay_app/src/features/auth/presentation/login_form/login_form_events.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/constants/sizes.dart';
import '../../../../core/presentation/widgets/password_text_field.dart';


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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<LoginFormBloc>();
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (v) {
              final state = context.read<LoginFormBloc>().state;
              final res = state.email.displayError;
              return res == null ? null : context.tr(res.localeKey);
            },
            onChanged: (v) => bloc.add(LoginFormEmailChangedEvent(v)),
            decoration: InputDecoration(
              helperText: context.tr(LocaleKeys.email)
            ),
          ),
          h16gap,
          PasswordTextField(
            validator: (v) {
              final state = context.read<LoginFormBloc>().state;
              var res = state.password.displayError;
              return res == null ? null : context.tr(res.localeKey);
            },
            onChanged: (v) => bloc.add(LoginFormPasswordChangedEvent(v)),
            helperText: context.tr(LocaleKeys.password)
          ),
          if (widget.confirmPassword) ...[
            h16gap, 
            PasswordTextField(
              validator: (v) {
                final state = context.read<LoginFormBloc>().state;
                final res = state.password.confirmationPassword?.displayError;
                return res == null ? null : context.tr(res.localeKey);
              },
              onChanged: (v) => bloc.add(LoginFormConfirmPasswordChangedEvent(v)),
              helperText: context.tr(LocaleKeys.confirmPassword),
            )
          ]
        ],
      ),
    );
  }
}