part of 'tasks_cubit.dart';

sealed class TasksState {
  final DateTime? selectedDate;
  final DateTime? currentMonth;

  TasksState({
    this.selectedDate,
    this.currentMonth,
  });

  TasksState copyWith({
    DateTime? selectedDate,
    DateTime? currentMonth,
  });
}

final class TaskInitial extends TasksState {
  TaskInitial({
    DateTime? selectedDate,
    DateTime? currentMonth,
  }) : super(selectedDate: selectedDate, currentMonth: currentMonth);

  @override
  TaskInitial copyWith({
    DateTime? selectedDate,
    DateTime? currentMonth,
  }) {
    return TaskInitial(
      selectedDate: selectedDate ?? this.selectedDate,
      currentMonth: currentMonth ?? this.currentMonth,
    );
  }
}
