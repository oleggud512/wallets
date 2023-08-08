import 'package:ads_pay_app/src/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    return MaterialApp.router(
      routerConfig: router.config(),
      
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      themeMode: themeBloc.state,
      debugShowCheckedModeBanner: false,
      theme: themeBloc.lightTheme,
      darkTheme: themeBloc.darkTheme,
    );
  }
}
