import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_events.dart';
import 'package:ads_pay_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_bloc.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/constants/strings.dart';
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
      context.pushRoute(const DeleteAccountRoute());
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
      title: Text(context.tr('${LocaleKeys.themeMode}.${themeMode.name}'))
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final easyLl = EasyLocalization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(authRepo.currentUser!.email),
        centerTitle: true,
      ),
      body: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThemeRadio(ThemeMode.light),
              buildThemeRadio(ThemeMode.dark),
              buildThemeRadio(ThemeMode.system),
              const Divider(),
              ListTile(
                title: DropdownButtonFormField<Locale>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  value: easyLl!.currentLocale,
                  items: [
                    DropdownMenuItem(
                      value: AppLocale.en.l,
                      child: Text(context.tr(LocaleKeys.english)),
                    ),
                    DropdownMenuItem(
                      value: AppLocale.ru.l,
                      child: Text(context.tr(LocaleKeys.english)),
                    ),
                  ],
                  onChanged: (v) {
                    easyLl.setLocale(v!);
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
                title: Text(context.tr(LocaleKeys.signOut))
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
                title: Text(context.tr(LocaleKeys.deleteAccount)),
              ),
            ]
          );
        }
      )
    );
  }
}