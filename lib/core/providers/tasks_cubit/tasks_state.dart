part of 'tasks_cubit.dart';

enum TasksStatus { initial, loading, success, error }

final class TasksState extends Equatable {
  const TasksState({
    this.selectedDate,
    this.currentMonth,
    this.status = TasksStatus.initial,
  });

  final TasksStatus status;
  final DateTime? selectedDate;
  final DateTime? currentMonth;

  TasksState copyWith({
    TasksStatus? status,
    DateTime? selectedDate,
    DateTime? currentMonth,
  }) {
    return TasksState(
      status: status ?? this.status,
      selectedDate: selectedDate ?? this.selectedDate,
      currentMonth: currentMonth ?? this.currentMonth,
    );
  }

  @override
  List<Object?> get props => [selectedDate, currentMonth, status];
}
