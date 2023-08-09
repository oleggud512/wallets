import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/common/constants/strings.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color_schemes.g.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  late final ThemeData lightTheme;
  late final ThemeData darkTheme;

  ThemeBloc() : super(ThemeMode.system) {
    initTheme();

    on<ThemeChangeThemeEvent>((event, emit) async {
      if (event.newTheme == state) return;
      emit(event.newTheme);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(PrefsStrings.themeMode, event.newTheme.name);
    });

    on<ThemeLoadEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final mode = prefs.getString(PrefsStrings.themeMode);
      if (mode == null) return;
      emit(ThemeMode.values.firstWhere((m) => m.name == mode));
    });
  }

  void initTheme() {
    var inputShape = InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(p8)
      )
    );

    lightTheme = ThemeData(
      useMaterial3: true, 
      colorScheme: lightColorScheme,
      inputDecorationTheme: inputShape
    );

    darkTheme = ThemeData(
      useMaterial3: true, 
      colorScheme: darkColorScheme,
      inputDecorationTheme: inputShape
    );
  }

}