import 'package:ads_pay_app/src/core/common/context_ext.dart';
import 'package:ads_pay_app/src/core/common/string_ext.dart';
import 'package:ads_pay_app/src/core/presentation/localizations/app_localizations.dart';
import 'package:ads_pay_app/src/core/presentation/localizations/localization_cubit.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_events.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_bloc.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/constants/sizes.dart';
import '../../../core/presentation/yes_no_dialog.dart';
import '../../../get_it.dart';
import '../../auth/presentation/login/login_page.dart';


@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthRepository authRepo = getIt();
  late ThemeBloc themeBloc;
  
  @override
  void initState() {
    super.initState();
    themeBloc = context.read<ThemeBloc>();
  }

  onThemeChanged(ThemeMode? newThemeMode) {
    themeBloc.add(ThemeChangeThemeEvent(newThemeMode!));
  }

  onSignOut() async {
    bool? isSignOut = await YesNoDialog(
      message: 'Sign out?'.hardcoded
    ).show(context);
    if (mounted && isSignOut == true ) {
      await authRepo.signOut();
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).pushAndPopUntil(
        LoginRoute(), predicate: (route) => true);
    }
  }

  onDeleteAccount() async {
    bool? delete = await YesNoDialog(
      message: 'Delete account?'.hardcoded
    ).show(context);
    if (delete == true && mounted) {
      context.pushRoute(LoginRoute(action: LoginAction.deleteUser));
    }
  }
  
  Widget buildThemeRadio(ThemeMode themeMode) {
    return ListTile(
      onTap: () {
        onThemeChanged(themeMode);
      },
      leading: Radio<ThemeMode>(
        activeColor: Theme.of(context).colorScheme.secondary,
        value: themeMode,
        groupValue: themeBloc.state,
        onChanged: onThemeChanged
      ),
      title: Text('${themeMode.name.capitalize()} theme')
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final localeCubit = context.watch<LocaleCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(authRepo.currentUser!.email),
        centerTitle: true,
      ),
      body: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return Column(
            children: [
              buildThemeRadio(ThemeMode.light),
              buildThemeRadio(ThemeMode.dark),
              buildThemeRadio(ThemeMode.system),
              const Divider(),
              ListTile(
                title: DropdownButtonFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  value: localeCubit.state,
                  items: [
                    DropdownMenuItem(
                      value: AppLocale.en,
                      child: Text(context.ll!.english),
                    ),
                    DropdownMenuItem(
                      value: AppLocale.ru,
                      child: Text(context.ll!.russian),
                    ),
                  ],
                  onChanged: (v) {
                    localeCubit.changeLocale(v!);
                  },
                ),
              ),
              const Divider(),
              ListTile(
                enabled: authRepo.isSignedIn,
                onTap: onSignOut,
                textColor: Theme.of(context).colorScheme.primary,
                iconColor: Theme.of(context).colorScheme.primary,
                leading: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.logout),
                ),
                title: Text('Sign out'.hardcoded)
              ),
              ListTile(
                enabled: authRepo.isSignedIn,
                onTap: onDeleteAccount,
                textColor: Colors.red,
                iconColor: Colors.red,
                leading: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.delete),
                ),
                title: Text('Delete account'.hardcoded),
              ),
            ]
          );
        }
      )
    );
  }
}