import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';

import 'stream_list_task.dart';

class TabsListData extends StatelessWidget {
  const TabsListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskCubit, TasksState>(
        buildWhen: (previous, current) {
          return previous.selectedDate != current.selectedDate;
        },
        builder: (context, state) {
          return TabBarView(
            children: [
              StreamListTask(
                stream: context.read<TaskCubit>().getTask(),
                emptyText: 'No hay tareas',
              ),
              StreamListTask(
                stream: context
                    .read<TaskCubit>()
                    .getTaskByStatus([TaskStatus.pending.value]),
                emptyText: 'No hay tareas pendientes',
              ),
              StreamListTask(
                stream: context
                    .read<TaskCubit>()
                    .getTaskByStatus([TaskStatus.completed.value]),
                emptyText: 'No hay tareas completadas',
              ),
            ],
          );
        },
      ),
    );
  }
}
