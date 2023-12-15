import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TaskGateway {
  Stream<QuerySnapshot>? getTask();
  Future<bool> createTask(Map<String, dynamic> data);
}
