import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/document_reference_convert.dart';
import 'package:todo/core/helpers/timestamp_convert.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskModel {
  const TaskModel({
    this.reference,
    this.createdAt,
    this.title = "",
    this.description = "",
    this.status = TaskStatus.pending,
  });

  final String title;
  final String description;
  final TaskStatus status;

  @DocumentReferenceConverter()
  final DocumentReference? reference;

  @TimestampConverter()
  final DateTime? createdAt;

  TaskModel copyWith({
    TaskStatus? status,
    DocumentReference? reference,
    DateTime? createdAt,
    String? title,
    String? description,
  }) =>
      TaskModel(
        status: status ?? this.status,
        reference: reference ?? this.reference,
        title: title ?? this.title,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
      );

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
