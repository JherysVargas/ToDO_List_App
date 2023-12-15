import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/task/task.dart';
import 'package:todo/domain/use_cases/task/task_use_cases.dart';

part 'tasks_state.dart';

class TaskCubit extends Cubit<TasksState> {
  final TaskUseCase taskUseCase;

  TaskCubit({required this.taskUseCase}) : super(const TasksState());

  DateTime _getInitDate() {
    final date = state.selectedDate ?? DateTime.now();

    return DateTime(date.year, date.month, date.day, 0, 0, 0);
  }

  DateTime _getEndDate() {
    final date = state.selectedDate ?? DateTime.now();

    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  Stream<QuerySnapshot>? getTask() =>
      taskUseCase.getTask(_getInitDate(), _getEndDate());

  Stream<QuerySnapshot>? getTaskByStatus(List<String> status) =>
      taskUseCase.getTaskByStatus(status, _getInitDate(), _getEndDate());

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

  void updateTask(
      DocumentReference reference, Map<String, dynamic> data) async {
    emit(state.copyWith(status: TasksStatus.loading));
    final response = await taskUseCase.update(reference, data);

    if (response) {
      emit(state.copyWith(status: TasksStatus.success));
    } else {
      emit(state.copyWith(status: TasksStatus.error));
    }
  }

  void deleteTask(DocumentReference reference) async {
    await taskUseCase.delete(reference);
  }
}
