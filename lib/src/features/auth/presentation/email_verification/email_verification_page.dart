import 'dart:async';

import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/localization/locale_keys.g.dart';
import '../../../../router.dart';


@RoutePage()
class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  late AuthRepository authServ = getIt();

  @override
  void initState() {
    super.initState();
    authServ.sendVerificationEmail();

    Timer.periodic(const Duration(seconds: 3), (timer) async { 
      await authServ.refreshUser();
      if (authServ.isEmailVerified) {
        timer.cancel();
        if (mounted) AutoRouter.of(context).replaceAll([const WalletsRoute()]); // тогда, ничего не произойдет если ничего не произойдет и тебя оставит на WalletsPage, если все ок. 
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authServ.currentUser!.email),
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
              style: Theme.of(context).textTheme.titleLarge
            ),
            FilledButton.icon(
              icon: const Icon(Icons.email),
              label: Text('Resent Email'.hardcoded),
              onPressed: () async {
                authServ.sendVerificationEmail();
              }
            ),
            TextButton(
              child: Text('Cancel'.hardcoded),
              onPressed: () async {
                // authServ.signOut();
                print('NOTHING IS HAPPENING');
              }
            ),
          ]
        ),
      )
    );
  }
}