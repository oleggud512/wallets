import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_events.dart';
import 'package:ads_pay_app/src/features/auth/application/use_cases/get_current_user_use_case.dart';
import 'package:ads_pay_app/src/features/auth/application/use_cases/sign_out_use_case.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_bloc.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/constants/strings.dart';
import '../../../core/presentation/widgets/yes_no_dialog.dart';
import '../../../get_it.dart';


@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  void onThemeChanged(ThemeMode? newThemeMode) {
    context.read<ThemeBloc>().add(ThemeChangeThemeEvent(newThemeMode!));
  }

  void onSignOut() async {
    bool? isSignOut = await YesNoDialog(
      message: context.tr(LocaleKeys.confirmSignOut)
    ).show(context);
    if (isSignOut != true) return;

    await getIt<SignOutUseCase>()(); // TODO: error handling
    if (mounted) AutoRouter.of(context).replaceAll([const WalletsRoute()]);
  }

  void onDeleteAccount() {
    context.pushRoute(const DeleteAccountRoute());
  }

  void onLocaleChanged(Locale? v) {
    context.setLocale(v!);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getIt<GetCurrentUserUseCase>()()?.email ?? context.tr(LocaleKeys.noEmail)),
        centerTitle: true,
      ),
      body: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThemeRadio(ThemeMode.light, state),
              buildThemeRadio(ThemeMode.dark, state),
              buildThemeRadio(ThemeMode.system, state),
              const Divider(),
              ListTile(
                title: DropdownButtonFormField<Locale>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  items: [
                    DropdownMenuItem(
                      value: AppLocale.en.l,
                      child: Text(context.tr(LocaleKeys.english)),
                    ),
                    DropdownMenuItem(
                      value: AppLocale.ru.l,
                      child: Text(context.tr(LocaleKeys.russian)),
                    ),
                  ],
                  value: context.locale,
                  onChanged: onLocaleChanged,
                ),
              ),
              const Divider(),
              ListTile(
                // enabled: authRepo.isSignedIn,
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
                // enabled: authRepo.isSignedIn,
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

  Widget buildThemeRadio(ThemeMode themeMode, ThemeMode groupValue) {
    return ListTile(
      onTap: () => onThemeChanged(themeMode),
      leading: Radio<ThemeMode>(
        value: themeMode,
        groupValue: groupValue,
        onChanged: onThemeChanged
      ),
      title: Text(context.tr('${LocaleKeys.themeMode}.${themeMode.name}'))
    );
  }
}