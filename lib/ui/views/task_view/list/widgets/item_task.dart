import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
import 'package:todo/core/helpers/capitalize_string_extension.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/ui/widgets/custom_card.dart';
import 'package:todo/ui/widgets/snack_bar_alert_widget.dart';

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
        child: _buildCheck(context),
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

  Widget _buildCheck(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
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
      title: _buildTitleTask(),
      subtitle: _buildSubTitleTask(),
    );
  }

  Widget _buildTitleTask() {
    return AnimatedDefaultTextStyle(
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
    );
  }

  Widget _buildSubTitleTask() {
    return Text(
      task.description.capitalize(),
      style: TextStyle(
        color: ColorsAppTheme.content.shade500,
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
}
