import 'package:ads_pay_app/src/core/common/constants/strings.dart';
import 'package:ads_pay_app/src/core/presentation/localizations/app_localizations_en.dart';
import 'package:ads_pay_app/src/core/presentation/localizations/app_localizations_ru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localizations.dart';

class _LocaleCodes {
  static const String en = 'en';
  static const String ru = 'ru';
}

enum AppLocale {
  ru(Locale(_LocaleCodes.ru)), 
  en(Locale(_LocaleCodes.en));

  /// locale
  final Locale l;
  const AppLocale(this.l);
}

class LocaleCubit extends Cubit<AppLocale> {
  LocaleCubit() : super(AppLocale.en);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(PrefsStrings.currentLocale) ?? LocalizationStrings.enLocaleCode;
    emit(AppLocale.values.firstWhere((l) => l.l.languageCode == code));
  }

  Future<void> changeLocale(AppLocale newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    if (newLocale == state) return;
    await prefs.setString(PrefsStrings.currentLocale, newLocale.l.languageCode);
    emit(newLocale);
  }

}