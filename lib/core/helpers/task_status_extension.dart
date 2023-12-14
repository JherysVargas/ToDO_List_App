import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';

extension TaskStatusExtension on TaskStatus {
  String get name {
    switch (this) {
      case TaskStatus.pending:
        return 'Pendiente';
      case TaskStatus.completed:
        return 'Completado';
      default:
        return 'Pendiente';
    }
  }

  Color get color {
    switch (this) {
      case TaskStatus.pending:
        return ColorsAppTheme.content;
      case TaskStatus.completed:
        return ColorsAppTheme.primary;
      default:
        return ColorsAppTheme.content;
    }
  }
}
