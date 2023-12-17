import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/domain/models/task/gateway/task.dart';

@Injectable(as: TaskGateway)
class TaskImpl extends TaskGateway {
  final Logger _logger;
  final FirebaseFirestore _firestore;

  static const _keyCollection = "tasks";

  TaskImpl(this._firestore, this._logger);

  @override
  Stream<QuerySnapshot>? getTask(DateTime initDate, DateTime endDate) {
    try {
      return _firestore
          .collection(_keyCollection)
          .where('date', isGreaterThanOrEqualTo: initDate)
          .where('date', isLessThanOrEqualTo: endDate)
          .orderBy('date', descending: true)
          .orderBy("createdAt", descending: true)
          .snapshots();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Stream<QuerySnapshot>? getTaskByStatus(
    List<String> status,
    DateTime initDate,
    DateTime endDate,
  ) {
    try {
      return _firestore
          .collection(_keyCollection)
          .where('date', isGreaterThanOrEqualTo: initDate)
          .where('date', isLessThanOrEqualTo: endDate)
          .where("status", whereIn: status)
          .orderBy('date', descending: true)
          .orderBy("createdAt", descending: true)
          .snapshots();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<bool> createTask(Map<String, dynamic> data) async {
    return _firestore
        .collection(_keyCollection)
        .add(data)
        .then((value) => true)
        .catchError((onError) {
      _logger.e(onError);
      return false;
    });
  }

  @override
  Future<bool> update(DocumentReference ref, Map<String, dynamic> data) async {
    return ref.update(data).then((value) => true).catchError((onError) {
      _logger.e(onError);
      return false;
    });
  }

  @override
  Future<bool> delete(DocumentReference ref) async {
    return ref.delete().then((value) => true).catchError((onError) {
      _logger.e(onError);
      return false;
    });
  }
}
