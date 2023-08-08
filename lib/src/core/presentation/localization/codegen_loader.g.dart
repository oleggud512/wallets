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
  "description": "Описание",
  "english": "Английский",
  "russian": "Русский",
  "signOut": "Выйти из аккаунта",
  "deleteAccount": "Удалить аккаунт",
  "themeMode": {
    "light": "Светлая",
    "dark": "Темная",
    "system": "Как в системе"
  },
  "theme": "Тема",
  "emailErrors": {
    "notFound": "Email не найден",
    "invalid": "Неправильная форма email"
  },
  "passwordErrors": {
    "incorrect": "Неверный пароль",
    "dontMatch": "Пароли не совпадают",
    "invalid": "Пароль должен быть длиннее шести символов",
    "userNotFound": "Пользователь не найден"
  },
  "email": "Email",
  "password": "Пароль",
  "confirmPassword": "Подтвердите пароль",
  "wallets": "Wallets",
  "verificationMailMessage": "На вашу электронную почту было отправлено письмо для подтверждения.",
  "resendEmail": "Отправить снова",
  "cancel": "Отменить",
  "firebaseExceptions": {
    "tooManyRequests": "Слишком много запросов, пожалуйста подождите",
    "networkRequestFailed": "Нет сети",
    "wrongPassword": "Неверный пароль"
  },
  "confirmDeleteHistoryNode": "Вы уверенны, что хотите удалить эту запись?",
  "confirmSignOut": "Вы уверенны что хотите выйти из аккаунта?",
  "confirmDeleteAccount": "Вы уверенны что хотите удалить аккаунт?",
  "edit": "Редактировать",
  "delete": "Удалить"
};
static const Map<String,dynamic> en = {
  "save": "Save",
  "description": "Description",
  "english": "English",
  "russian": "Russian",
  "signOut": "Sign Out",
  "deleteAccount": "Delete Account",
  "themeMode": {
    "light": "Light",
    "dark": "Dark",
    "system": "System"
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
  "wallets": "Wallets",
  "verificationMailMessage": "A verification email has been send to your email",
  "resendEmail": "Resent Email",
  "cancel": "Cancel",
  "firebaseExceptions": {
    "tooManyRequests": "Too many requests",
    "networkRequestFailed": "No Internet",
    "wrongPassword": "Wrong password",
    "userNotFound": "User not found"
  },
  "confirmDeleteHistoryNode": "Are you sure to delete this record?",
  "confirmSignOut": "Are you sure you want to sign out?",
  "confirmDeleteAccount": "Are you sure you want to delete account?",
  "edit": "Edit",
  "delete": "Delete"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
