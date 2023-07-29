import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/yes_no_dialog.dart';
import '../../auth/presentation/login_page.dart';


@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late FirebaseAuthRepositoryImpl authServ;
  late ThemeService themeServ;
  
  @override
  void initState() {
    super.initState();
    authServ = context.read<FirebaseAuthRepositoryImpl>();
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
              bool? isSignOut = await YesNoDialog(
                message: 'Sign out?'.hardcoded
              ).show(context);
              if (mounted && isSignOut == true ) {
                await authServ.signOut();
                // ignore: use_build_context_synchronously
                AutoRouter.of(context).pushAndPopUntil(
                  LoginRoute(), predicate: (route) => true);
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
              bool? isDelete = await YesNoDialog(
                message: 'Delete account?'.hardcoded
              ).show(context);
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