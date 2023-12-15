import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/use_cases/task/task_use_cases.dart';

part 'tasks_state.dart';

class TaskCubit extends Cubit<TasksState> {
  final TaskUseCase taskUseCase;

  TaskCubit({required this.taskUseCase}) : super(TaskInitial());

  Stream<QuerySnapshot>? getTask() => taskUseCase.getTask();

  void selectedDate(DateTime selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
  }

  void changeMonth(DateTime currentMonth) {
    emit(state.copyWith(currentMonth: currentMonth));
  }
}
