import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: ColorsAppTheme.content),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: ColorsAppTheme.grey.shade100,
      brightness: Brightness.light,
      primary: ColorsAppTheme.primary,
      secondary: ColorsAppTheme.secondary,
      tertiary: ColorsAppTheme.content,
    ),
  );
}
