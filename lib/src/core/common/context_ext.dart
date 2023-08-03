import 'package:flutter/material.dart';

import '../presentation/localizations/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  Ll? get ll => Ll.of(this);
}