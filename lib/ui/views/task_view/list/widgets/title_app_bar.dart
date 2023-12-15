import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todo/config/theme/colors_theme.dart';
import 'package:todo/core/helpers/capitalize_string_extension.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TaskCubit, TasksState, DateTime>(
      selector: (state) {
        return state.currentMonth ?? DateTime.now();
      },
      builder: (context, currentMonth) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          textColor: ColorsAppTheme.content,
          title: Text(
            Jiffy.parseFromDateTime(currentMonth)
                .format(pattern: 'MMMM, yyyy')
                .capitalize(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
