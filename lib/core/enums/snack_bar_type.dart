import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/domain/models/alert/snackbar_type.dart';

enum SnackBarType {
  success(
    SnackBarTypeModel(
      label: 'Éxito',
      color: ColorsAppTheme.success,
      icon: Icons.check_circle,
    ),
  ),
  error(
    SnackBarTypeModel(
      label: 'Error',
      icon: Icons.error,
      color: ColorsAppTheme.error,
    ),
  );

  const SnackBarType(this.type);
  final SnackBarTypeModel type;
}
