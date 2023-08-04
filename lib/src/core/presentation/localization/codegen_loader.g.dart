// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "save": "Сохранить",
  "english": "Английский",
  "russian": "Русский",
  "signOut": "Выйти из аккаунта",
  "deleteAccount": "Удалить аккаунт",
  "themeMode": {
    "light": "Светлая",
    "dark": "Темная"
  },
  "theme": "Тема",
  "emailErrors": {
    "notFound": "Email не найден",
    "invalid": "Неправильная форма email"
  },
  "passwordErrors": {
    "incorrect": "Неверный пароль",
    "dontMatch": "Пароли не совпадают",
    "invalid": "Пароль должен быть длиннее шести символов"
  },
  "email": "Email",
  "password": "Пароль",
  "confirmPassword": "Подтвердите пароль",
  "wallets": "Wallets"
};
static const Map<String,dynamic> en = {
  "save": "Save",
  "english": "English",
  "russian": "Russian",
  "signOut": "Sign Out",
  "deleteAccount": "Delete Account",
  "themeMode": {
    "light": "Light",
    "dark": "Dark"
  },
  "theme": "Theme",
  "emailErrors": {
    "notFound": "Email not found",
    "invalid": "Invalid email"
  },
  "passwordErrors": {
    "incorrect": "Password is incorrect",
    "dontMatch": "Passwords don't match",
    "invalid": "Password is invalid (should be longer than 6 characters)"
  },
  "email": "Email",
  "password": "Password",
  "confirmPassword": "Confirm password",
  "wallets": "Wallets"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
