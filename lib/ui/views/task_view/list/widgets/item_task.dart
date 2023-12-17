import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/ui/widgets/custom_card.dart';
import 'package:todo/ui/widgets/snack_bar_alert_widget.dart';

import 'item_task_content.dart';
import 'item_task_header.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.zero,
      borderRadius: 14,
      child: Dismissible(
        key: Key(task.reference!.id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => _deleteTask(context, direction),
        background: _slideLeftBackground(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemTaskHeader(task: task),
              ItemTaskContent(task: task),
            ],
          ),
        ),
      ),
    );
  }

  Widget _slideLeftBackground() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: ColorsAppTheme.error,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Feather.trash, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Eliminar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTask(BuildContext context, DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      context.read<TaskCubit>().deleteTask(task.reference!);
      SnackBarFloating.show(
        message: 'Tarea eliminada con éxito!',
        context: context,
      );
    }
  }
}
