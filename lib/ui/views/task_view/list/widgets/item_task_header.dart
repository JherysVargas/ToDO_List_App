import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/capitalize_string_extension.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/domain/models/task/task.dart';

class ItemTaskHeader extends StatelessWidget {
  const ItemTaskHeader({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
      child: Row(
        children: [
          _buildCheck(context),
          const SizedBox(width: 8),
          _buildTitle(),
        ],
      ),
    );
  }

  Widget _buildCheck(BuildContext context) {
    return Checkbox(
      activeColor: ColorsAppTheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(
        color: ColorsAppTheme.grey,
        width: 1.5,
      ),
      value: task.status == TaskStatus.completed,
      onChanged: (value) {
        if (value!) {
          context.read<TaskCubit>().updateTask(
            task.reference!,
            {"status": TaskStatus.completed.value},
          );
        }
      },
    );
  }

  Widget _buildTitle() {
    return Flexible(
      child: AnimatedDefaultTextStyle(
        duration: kThemeAnimationDuration,
        style: TextStyle(
          fontSize: 16,
          decoration: task.status == TaskStatus.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: task.status == TaskStatus.completed
              ? ColorsAppTheme.secondary
              : ColorsAppTheme.content,
          fontWeight: FontWeight.w600,
        ),
        child: Text(task.title.capitalize()),
      ),
    );
  }
}
