import 'package:ads_pay_app/functions.dart';
import 'package:ads_pay_app/services/auth_service.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
  
  Widget buildThemeRadio(ThemeMode themeMode) {
    return ListTile(
      onTap: () {
        onThemeChanged(themeMode);
      },
      leading: Radio<ThemeMode>(
        activeColor: Theme.of(context).colorScheme.secondary,
        value: themeMode,
        groupValue: themeServ.curThemeMode,
        onChanged: onThemeChanged
      ),
      title: Text('${themeMode.name.replaceFirst(themeMode.name[0], themeMode.name[0].toUpperCase())} theme')
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authServ.auth.currentUser!.email!),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildThemeRadio(ThemeMode.light),
          buildThemeRadio(ThemeMode.dark),
          buildThemeRadio(ThemeMode.system),
          const Divider(),
          ListTile(
            enabled: authServ.auth.currentUser != null,
            onTap: () async {
              bool? isSignOut = await showYesNoDialog(
                context: context,
                message: 'Sign out?',
              );
              if (isSignOut == true && mounted) {
                authServ.signOut().then((v) => Navigator.pop(context));
              }
            },
            textColor: Theme.of(context).colorScheme.primary,
            iconColor: Theme.of(context).colorScheme.primary,
            leading: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.logout),
            ),
            title: const Text('Sign out')
          ),
          ListTile(
            enabled: authServ.auth.currentUser != null,
            onTap: () async {
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
            textColor: Colors.red,
            iconColor: Colors.red,
            leading: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.delete),
            ),
            title: const Text('Delete account'),
          ),
        ]
      )
    );
  }
}