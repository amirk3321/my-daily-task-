

import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:sembast/sembast.dart';

abstract class LocalRepository{
  Future<void> addNewTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<List<TaskEntity>> getAllTasks();
  Future<void> getNotification(TaskEntity task);
  Future<void> turnOnNotification(TaskEntity task);
  Future<Database> openDatabase();
}