

import 'package:my_daily_task/features/data/local_data_source/local_data_source.dart';
import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class LocalRepositoryImpl implements LocalRepository{

  final LocalDataSource localDataSource;

  LocalRepositoryImpl({this.localDataSource});

  @override
  Future<void> addNewTask(TaskEntity task) async =>
      localDataSource.addNewTask(task);

  @override
  Future<void> deleteTask(TaskEntity task) async =>
      localDataSource.deleteTask(task);

  @override
  Future<List<TaskEntity>> getAllTasks() async =>
      localDataSource.getAllTasks();

  @override
  Future<void> getNotification(TaskEntity task) async =>
      localDataSource.getNotification(task);

  @override
  Future<Database> openDatabase() async =>
      openDatabase();

  @override
  Future<void> turnOnNotification(TaskEntity task) =>
      localDataSource.turnOnNotification(task);

  @override
  Future<void> updateTask(TaskEntity task) async =>
      localDataSource.updateTask(task);

}