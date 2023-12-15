import 'package:flutter/material.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/enums/task.dart';
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
        checkboxShape: const CircleBorder(),
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
        title: Text(task.title),
        subtitle: Text(task.description),
        value: task.status == TaskStatus.completed,
        onChanged: (value) {},
      ),
    );
  }
}
