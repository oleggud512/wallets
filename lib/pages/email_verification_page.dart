import 'dart:async';

import 'package:ads_pay_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  late AuthService authServ;

  @override
  void initState() {
    super.initState();
    authServ = context.read<AuthService>();
    authServ.sendVerificationEmail();

    Timer.periodic(const Duration(seconds: 3), (timer) async { 
      await authServ.auth.currentUser!.reload();
      print('RELOADED\nRELOADED\nRELOADED  ${timer.tick}  ${authServ.auth.currentUser?.emailVerified}\n\n');
      if (authServ.auth.currentUser?.emailVerified == true) {
        timer.cancel();
        print('IT WAS LAST TICK');
      }
    });
  }

  @override
  void dispose() {
    print('EMAIL VERIFICATION PAGE DISPOSED');
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authServ.auth.currentUser!.email!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('A verification email has been send to your email.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.email),
              label: const Text('Resent Email'),
              onPressed: () async {
                authServ.sendVerificationEmail();
              }
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () async {
                authServ.signOut();
              }
            ),
          ]
        ),
      )
    );
  }
}