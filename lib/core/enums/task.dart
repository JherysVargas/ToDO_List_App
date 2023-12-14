import 'package:json_annotation/json_annotation.dart';

enum TaskStatus {
  @JsonValue('COMPLETED')
  completed,

  @JsonValue('PENDING')
  pending,
}
