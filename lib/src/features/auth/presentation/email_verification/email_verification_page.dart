
import 'dart:async';

import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/common/extensions/build_context.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/features/auth/presentation/email_verification/email_verification_events.dart';
import 'package:ads_pay_app/src/features/auth/presentation/email_verification/email_verification_page_bloc.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/localization/locale_keys.g.dart';
import '../../../../router.dart';
import 'email_verification_page_state.dart';


@RoutePage()
class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  EmailVerificationPageBloc? bloc;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) { 
      bloc?.add(EmailVerificationPageCheckVerifiedEvent());
    });
    super.initState();
  }
  void onResend() async { // TODO: or better `onResend(BuildContext context)`, as I did before?
    bloc!.add(EmailVerificationPageSendEmailEvent());
  }

  void onCancel() async {
    bloc!.add(EmailVerificationPageCancelVerificationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmailVerificationPageBloc(getIt(), getIt(), getIt(), getIt())
        ..add(EmailVerificationPageSendEmailEvent()),
      child: BlocConsumer<EmailVerificationPageBloc, EmailVerificationPageState>(
        listener: (context, state) {
          switch (state) {
            case EmailVerificationPageState.success: 
              context.autoRotuer.replaceAll([const WalletsRoute()]);
              break;
            case EmailVerificationPageState.cancelled:
              context.autoRotuer.replaceAll([const LoginRoute()]);
              break;
            default: break;
          }
        },
        builder: (context, state) {
          bloc ??= context.read<EmailVerificationPageBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(getIt<AuthRepository>().currentUser?.email ?? 
                context.tr(LocaleKeys.noEmail)),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(context.tr(LocaleKeys.verificationMailMessage),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  FilledButton.icon(
                    icon: const Icon(Icons.email),
                    label: Text(context.tr(LocaleKeys.resendEmail)),
                    onPressed: onResend,
                  ),
                  TextButton(
                    onPressed: onCancel,
                    child: Text(context.tr(LocaleKeys.cancel)),
                  ),
                ]
              ),
            )
          );
        }
      ),
    );
  }
}