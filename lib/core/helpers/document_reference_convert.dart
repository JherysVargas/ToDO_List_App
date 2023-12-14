import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference?, DocumentReference?> {
  const DocumentReferenceConverter();

  @override
  DocumentReference<Object?>? fromJson(DocumentReference<Object?>? document) {
    return document;
  }

  @override
  DocumentReference<Object?>? toJson(DocumentReference<Object?>? document) {
    return document;
  }
}
