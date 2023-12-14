import 'package:flutter/material.dart';

class ColorsAppTheme {
  static const int _primary = 0xFF00ECD2;
  static const int _content = 0xFF212938;
  static const int _secondary = 0xFF628DFF;
  static const int _success = 0xFF00B67A;
  static const int _error = 0xFFFF9A8A;
  static const int _grey = 0xFFD5D6DC;

  static const MaterialColor primary = MaterialColor(_primary, <int, Color>{
    50: Color(0xFFE0FDFA),
    100: Color(0xFFB3F9F2),
    200: Color(0xFF80F6E9),
    300: Color(0xFF4DF2E0),
    400: Color(0xFF26EFD9),
    500: Color(_primary),
    600: Color(0xFF00EACD),
    700: Color(0xFF00E7C7),
    800: Color(0xFF00E4C1),
    900: Color(0xFF00DFB6),
  });

  static const MaterialColor content = MaterialColor(_content, <int, Color>{
    50: Color(0xFFE4E5E7),
    100: Color(0xFFBCBFC3),
    200: Color(0xFF90949C),
    300: Color(0xFF646974),
    400: Color(0xFF424956),
    500: Color(_content),
    600: Color(0xFF1D2432),
    700: Color(0xFF181F2B),
    800: Color(0xFF141924),
    900: Color(0xFF0B0F17),
  });

  static const MaterialColor secondary = MaterialColor(_secondary, <int, Color>{
    50: Color(0xFFECF1FF),
    100: Color(0xFFD0DDFF),
    200: Color(0xFFB1C6FF),
    300: Color(0xFF91AFFF),
    400: Color(0xFF7A9EFF),
    500: Color(_secondary),
    600: Color(0xFF5A85FF),
    700: Color(0xFF507AFF),
    800: Color(0xFF4670FF),
    900: Color(0xFF345DFF),
  });

  static const MaterialColor success = MaterialColor(_success, <int, Color>{
    50: Color(0xFFE0F6EF),
    100: Color(0xFFB3E9D7),
    200: Color(0xFF80DBBD),
    300: Color(0xFF4DCCA2),
    400: Color(0xFF26C18E),
    500: Color(_success),
    600: Color(0xFF00AF72),
    700: Color(0xFF00A667),
    800: Color(0xFF009E5D),
    900: Color(0xFF008E4A),
  });

  static const MaterialColor error = MaterialColor(_error, <int, Color>{
    50: Color(0xFFFFF3F1),
    100: Color(0xFFFFE1DC),
    200: Color(0xFFFFCDC5),
    300: Color(0xFFFFB8AD),
    400: Color(0xFFFFA99C),
    500: Color(_error),
    600: Color(0xFFFF9282),
    700: Color(0xFFFF8877),
    800: Color(0xFFFF7E6D),
    900: Color(0xFFFF6C5A),
  });

  static const MaterialColor grey = MaterialColor(_grey, <int, Color>{
    50: Color(0xFFFAFAFB),
    100: Color(0xFFF2F3F5),
    200: Color(0xFFEAEBEE),
    300: Color(0xFFE2E2E7),
    400: Color(0xFFDBDCE1),
    500: Color(_grey),
    600: Color(0xFFD0D1D8),
    700: Color(0xFFCACCD3),
    800: Color(0xFFC4C6CE),
    900: Color(0xFFBABCC5),
  });
}
