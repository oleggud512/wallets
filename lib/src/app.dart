import 'package:ads_pay_app/src/core/presentation/localizations/localization_cubit.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/presentation/localizations/app_localizations.dart';
import 'core/presentation/theme/theme_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = context.read<AppRouter>();
    final themeBloc = context.watch<ThemeBloc>();
    final localeCubit = context.watch<LocaleCubit>();

    return MaterialApp.router(
      routerConfig: router.config(),
      
      localizationsDelegates: Ll.localizationsDelegates,
      supportedLocales: Ll.supportedLocales,
      locale: localeCubit.state.l,

      themeMode: themeBloc.state,
      debugShowCheckedModeBanner: false,
      theme: themeBloc.lightTheme,
      darkTheme: themeBloc.darkTheme,
    );
  }
}
