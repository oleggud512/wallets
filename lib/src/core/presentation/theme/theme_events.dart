import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_events.freezed.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  factory ThemeEvent() = _ThemeEvent;

  factory ThemeEvent.load() = ThemeLoadEvent;
  factory ThemeEvent.changeTheme(ThemeMode newTheme) = ThemeChangeThemeEvent; 
}