import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/domain/models/task/gateway/task.dart';

@injectable
class TaskUseCase {
  final TaskGateway _taskGateway;
  TaskUseCase(this._taskGateway);
  Stream<QuerySnapshot<Object?>>? getTask() => _taskGateway.getTask();
  Future<bool> createTask(Map<String, dynamic> data) =>
      _taskGateway.createTask(data);
}
