import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/domain/models/task/gateway/task.dart';

@Injectable(as: TaskGateway)
class TaskImpl extends TaskGateway {
  final Logger _logger;
  final FirebaseFirestore _firestore;

  final _keyCollection = "sales";

  TaskImpl(this._firestore, this._logger);

  @override
  Stream<QuerySnapshot>? getTask() {
    try {
      return _firestore
          .collection(_keyCollection)
          // .where("deliveryStatus", whereIn: [
          //   DeliveryStatus.pending.value.status,
          //   DeliveryStatus.inProgress.value.status,
          // ])
          .orderBy("createdAt", descending: true)
          .snapshots();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }
}
