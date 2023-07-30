import 'package:ads_pay_app/src/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeService>();
    final router = context.read<AppRouter>();
    return MaterialApp.router(
      routerConfig: router.config(),
      
      themeMode: context.watch<ThemeService>().curThemeMode,
      debugShowCheckedModeBanner: false,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
    );
  }
}
