import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/domain/models/task/gateway/task.dart';

@injectable
class TaskUseCase {
  final TaskGateway _taskGateway;
  TaskUseCase(this._taskGateway);

  Stream<QuerySnapshot<Object?>>? getTask(
    DateTime initDate,
    DateTime endDate,
  ) =>
      _taskGateway.getTask(initDate, endDate);

  Stream<QuerySnapshot<Object?>>? getTaskByStatus(
    List<String> status,
    DateTime initDate,
    DateTime endDate,
  ) =>
      _taskGateway.getTaskByStatus(status, initDate, endDate);

  Future<bool> createTask(Map<String, dynamic> data) =>
      _taskGateway.createTask(data);

  Future<bool> update(DocumentReference ref, Map<String, dynamic> data) =>
      _taskGateway.update(ref, data);

  Future<bool> delete(DocumentReference ref) => _taskGateway.delete(ref);
}
