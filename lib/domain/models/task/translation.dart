import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';

@JsonSerializable()
class TranslationModel {
  const TranslationModel({
    this.title = "",
    this.description = "",
  });

  final String title;
  final String description;

  TranslationModel copyWith({
    String? title,
    String? description,
  }) =>
      TranslationModel(
        title: title ?? this.title,
        description: description ?? this.description,
      );

  factory TranslationModel.fromRawJson(String str) =>
      TranslationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationModelToJson(this);
}
