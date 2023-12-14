import 'package:flutter/material.dart';

class SnackBarTypeModel {
  const SnackBarTypeModel({
    this.label = '',
    required this.icon,
    required this.color,
  });

  final Color color;
  final String label;
  final IconData icon;

  SnackBarTypeModel copyWith({
    Color? color,
    String? label,
    IconData? icon,
  }) {
    return SnackBarTypeModel(
      icon: icon ?? this.icon,
      color: color ?? this.color,
      label: label ?? this.label,
    );
  }
}
