import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';

import 'widgets/form.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, TasksState>(
      listener: _validateResponseCreateTask,
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
    if (state is TaskCreateSuccess) {
      Navigator.pop(context);
    } else if (state is TaskCreateError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al crear la tarea'),
        ),
      );
    }
  }
}
