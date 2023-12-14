import 'package:flutter/material.dart';

class TaskStatusModel {
  final String label;
  final String status;
  final MaterialColor color;

  const TaskStatusModel({
    required this.color,
    required this.label,
    required this.status,
  });
}
