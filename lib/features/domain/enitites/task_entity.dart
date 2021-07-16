

class TaskEntity {
  int id;
  final String title;
  final int colorIndex;
  final String time;
  final bool isCompleteTask;
  final bool isNotification;
  final String taskType;

  TaskEntity({
    this.title,
    this.colorIndex,
    this.time,
    this.isCompleteTask,
    this.isNotification,
    this.taskType,
  });
}
