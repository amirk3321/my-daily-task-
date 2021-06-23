import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_daily_task/features/data/local_data_source/local_data_source.dart';
import 'package:my_daily_task/features/data/models/task_model.dart';
import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

const String MAP_STORE = "MAP_STORE_TASK";

class LocalDataSourceImpl implements LocalDataSource {
  Completer<Database> _dbOpenCompleter;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<Database> get _db async => _dbOpenCompleter.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);

  Future _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, "task.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }

  @override
  Future<void> addNewTask(TaskEntity task) async {
    final newTask = TaskModel(
      title: task.title,
      isNotification: task.isNotification,
      colorIndex: task.colorIndex,
      time: task.title,
      isCompleteTask: task.isCompleteTask,
      taskType: task.taskType,
    ).toJson();
    _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);

    final recordSnapshots = await _taskStore.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((task) {
      final taskData = TaskModel.fromJson(task.value);

      taskData.id = task.key;

      return taskData;
    }).toList();
  }

  @override
  Future<void> getNotification(TaskEntity task) {
    if (task.isNotification == false) {
      //FIXME:show notification
      final dateTime = DateTime.parse(task.time);
      final androidChannel = AndroidNotificationDetails(
        task.id.toString(),
        "daily task notification",
        "daily task notification",
        icon: "@mipmap/ic_launcher",
        largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      );
      final iosChannel=IOSNotificationDetails();
      final notificationDetails=NotificationDetails(
        android: androidChannel,
        iOS: iosChannel
      );
      flutterLocalNotificationsPlugin.showDailyAtTime(task.id, task.title, "it's time for ${task.title}", Time(dateTime.hour,dateTime.minute,0), notificationDetails);
    } else {
      flutterLocalNotificationsPlugin.cancel(task.id);
    }
  }

  @override
  Future<Database> openDatabase() {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _initDatabase();
    }
    return _dbOpenCompleter.future;
  }

  @override
  Future<void> turnOnNotification(TaskEntity task) async {
    final newTask = TaskModel(
      title: task.title,
      isNotification: task.isNotification == true ? false : true,
      colorIndex: task.colorIndex,
      time: task.title,
      isCompleteTask: task.isCompleteTask,
      taskType: task.taskType,
    ).toJson();

    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final newTask = TaskModel(
      title: task.title,
      isNotification: task.isNotification,
      colorIndex: task.colorIndex,
      time: task.title,
      isCompleteTask: task.isCompleteTask == true ? false : true,
      taskType: task.taskType,
    ).toJson();

    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }
}
