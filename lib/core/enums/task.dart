enum TaskStatus {
  completed('COMPLETED'),
  pending('PENDING');

  const TaskStatus(this.value);
  final String value;
}
