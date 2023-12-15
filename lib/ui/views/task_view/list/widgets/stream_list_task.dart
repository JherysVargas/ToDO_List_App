import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/ui/widgets/activity_indicator.dart';

import 'item_task.dart';

class StreamListTask extends StatelessWidget {
  const StreamListTask({super.key, this.stream});

  final Stream<QuerySnapshot<Object?>>? stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ActivityIndicator();
        }

        final List<QueryDocumentSnapshot?> tasks = snapshot.data?.docs ?? [];

        if (tasks.isEmpty) {
          return const SizedBox();
        }

        return ListView.separated(
          itemCount: tasks.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final TaskModel task = TaskModel.fromJson(
              tasks[index]!.data()! as Map<String, dynamic>,
            ).copyWith(reference: tasks[index]!.reference);

            return ItemTask(task: task);
          },
        );
      },
    );
  }
}
