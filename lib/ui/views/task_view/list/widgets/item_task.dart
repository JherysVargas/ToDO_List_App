import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/capitalize_string_extension.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/ui/widgets/custom_card.dart';

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
      child: CheckboxListTile(
        activeColor: ColorsAppTheme.secondary,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabled: task.status == TaskStatus.pending,
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorsAppTheme.secondary.shade300;
            }
            return Colors.white;
          },
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide.none;
            }
            return const BorderSide(
              color: ColorsAppTheme.grey,
              width: 1.5,
            );
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: task.status == TaskStatus.completed,
        onChanged: (value) {
          context.read<TaskCubit>().updateTask(
            task.reference!,
            {"status": TaskStatus.completed.value},
          );
        },
        title: AnimatedDefaultTextStyle(
          duration: kThemeAnimationDuration,
          style: TextStyle(
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
        subtitle: Text(
          task.description.capitalize(),
          style: TextStyle(
            color: ColorsAppTheme.content.shade500,
          ),
        ),
      ),
    );
  }
}
