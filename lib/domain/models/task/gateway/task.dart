import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TaskGateway {
  Stream<QuerySnapshot>? getTask();
}
