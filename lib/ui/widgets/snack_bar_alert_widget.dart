import 'package:flutter/material.dart';
import 'package:todo/core/enums/snack_bar_type.dart';

class SnackBarFloating {
  static void show({
    required String message,
    required BuildContext context,
    IconData? icon,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 4),
    SnackBarType snackBarType = SnackBarType.success,
  }) {
    final typeAlert = snackBarType.type.copyWith(
      icon: icon,
      label: message,
      color: backgroundColor,
    );

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            typeAlert.icon,
            size: 22,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
              child: Text(
            typeAlert.label,
            style: const TextStyle(
              color: Colors.white,
            ),
          )),
        ],
      ),
      duration: duration,
      backgroundColor: typeAlert.color,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
