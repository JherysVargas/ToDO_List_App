import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorsAppTheme.primary,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: Colors.white,
      brightness: Brightness.light,
      primary: ColorsAppTheme.primary,
      secondary: ColorsAppTheme.secondary,
    ),
  );
}
