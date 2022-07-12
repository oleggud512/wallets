import 'package:ads_pay_app/functions.dart';
import 'package:ads_pay_app/services/auth_service.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';


class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AuthService authServ;
  late ThemeService themeServ;
  
  @override
  void initState() {
    super.initState();
    authServ = context.read<AuthService>();
    themeServ = context.read<ThemeService>();
  }

  onThemeChanged(ThemeMode? newThemeMode) {
    themeServ.setCurThemeMode(newThemeMode!);
  }
  
  Radio<ThemeMode> buildThemeRadio(ThemeMode themeMode) {
    return Radio<ThemeMode>(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: themeMode,
      groupValue: themeServ.curThemeMode,
      onChanged: onThemeChanged
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authServ.auth.currentUser!.email!),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: buildThemeRadio(ThemeMode.light),
            title: const Text('Light theme')
          ),
          ListTile(
            leading: buildThemeRadio(ThemeMode.dark),
            title: const Text('Dark theme')
          ),
          ListTile(
            leading: buildThemeRadio(ThemeMode.system),
            title: const Text('System theme')
          ),
          ListTile(
            enabled: authServ.auth.currentUser != null,
            title: TextButton(
              child: const Text('Sign out'),
              onPressed: () async {
                bool? isSignOut = await showYesNoDialog(
                  context: context,
                  message: 'Sign Out?',
                );
                if (isSignOut == true && mounted) {
                  authServ.signOut().then((v) => Navigator.pop(context));
                }
              },
            )
          ),
          ListTile(
            enabled: authServ.auth.currentUser != null,
            title: TextButton(
              child: const Text('Delete account'),
              onPressed: () async {
                bool? isDelete = await showYesNoDialog(
                  context: context, 
                  message: 'Delete account?'
                );
                if (isDelete == true && mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(
                        action: LoginAction.deleteUser,
                      )
                    )
                  ).then(
                    (v) => Navigator.pop(context)
                  );
                }
              },
            )
          ),
        ]
      )
    );
  }
}