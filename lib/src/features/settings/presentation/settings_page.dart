import 'package:ads_pay_app/src/core/common/string_ext.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/yes_no_dialog.dart';
import '../../../get_it.dart';
import '../../auth/presentation/login_page.dart';


@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthRepository authRepo = getIt();
  late ThemeService themeServ;
  
  @override
  void initState() {
    super.initState();
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
      title: Text('${themeMode.name.capitalize()} theme')
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authRepo.currentUser!.email),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildThemeRadio(ThemeMode.light),
          buildThemeRadio(ThemeMode.dark),
          buildThemeRadio(ThemeMode.system),
          const Divider(),
          ListTile(
            enabled: authRepo.isSignedIn,
            onTap: () async {
              bool? isSignOut = await YesNoDialog(
                message: 'Sign out?'.hardcoded
              ).show(context);
              if (mounted && isSignOut == true ) {
                await authRepo.signOut();
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
            enabled: authRepo.isSignedIn,
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