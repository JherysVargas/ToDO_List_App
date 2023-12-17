enum TaskStatus {
  completed('completed'),
  pending('pending');

  const TaskStatus(this.value);
  final String value;
}
