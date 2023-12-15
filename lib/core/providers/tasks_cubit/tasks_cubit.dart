import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/domain/use_cases/task/task_use_cases.dart';

part 'tasks_state.dart';

class TaskCubit extends Cubit<TasksState> {
  final TaskUseCase taskUseCase;

  TaskCubit({required this.taskUseCase}) : super(const TasksState());

  Stream<QuerySnapshot>? getTask() => taskUseCase.getTask();

  void selectedDate(DateTime selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
  }

  void changeMonth(DateTime currentMonth) {
    emit(state.copyWith(currentMonth: currentMonth));
  }

  void createTask(TaskModel task) async {
    emit(state.copyWith(status: TasksStatus.loading));
    final response = await taskUseCase.createTask(task.toJson());

    if (response) {
      emit(state.copyWith(status: TasksStatus.success));
    } else {
      emit(state.copyWith(status: TasksStatus.error));
    }
  }
}
