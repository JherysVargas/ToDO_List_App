import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TaskGateway {
  Stream<QuerySnapshot>? getTask(DateTime initDate, DateTime endDate);

  Stream<QuerySnapshot>? getTaskByStatus(
    List<String> status,
    DateTime initDate,
    DateTime endDate,
  );

  Future<bool> createTask(Map<String, dynamic> data);

  Future<bool> update(DocumentReference ref, Map<String, dynamic> data);

  Future<bool> delete(DocumentReference ref);
}
