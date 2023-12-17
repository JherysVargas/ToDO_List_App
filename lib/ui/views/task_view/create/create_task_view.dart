import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/enums/snack_bar_type.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/ui/widgets/snack_bar_alert_widget.dart';

import 'widgets/form.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, TasksState>(
      listener: _validateResponseCreateTask,
      listenWhen: (previous, current) {
        return current.status == TasksStatus.error ||
            current.status == TasksStatus.success;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Nueva tarea'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: FormCreateTask(),
        ),
      ),
    );
  }

  void _validateResponseCreateTask(BuildContext context, TasksState state) {
    if (state.status == TasksStatus.success) {
      Navigator.pop(context);
    } else if (state.status == TasksStatus.error) {
      SnackBarFloating.show(
        message: 'Error al crear la tarea',
        context: context,
        type: SnackBarType.error,
      );
    }
  }
}
