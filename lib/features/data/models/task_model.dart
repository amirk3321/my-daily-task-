import 'package:my_daily_task/features/domain/enitites/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int id,
    final String title,
    final int colorIndex,
    final String time,
    final bool isCompleteTask,
    final bool isNotification,
    final String taskType,
  }) : super(
          time: time,
          isCompleteTask: isCompleteTask,
          colorIndex: colorIndex,
          title: title,
          isNotification: isNotification,
    taskType: taskType,
        );

  static TaskModel fromJson(Map<String,dynamic> json){
    return TaskModel(
      title: json['title'],
      isCompleteTask: json['isCompleteTask'],
      colorIndex: json['colorIndex'],
      time: json['time'],
      isNotification: json['isNotification'],
      taskType: json['taskType'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "title":title,
      "isCompleteTask":isCompleteTask,
      "colorIndex":colorIndex,
      "time":time,
      "isNotification":isNotification,
      "taskType":taskType,
    };
  }
}
