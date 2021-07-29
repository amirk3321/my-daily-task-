import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:my_daily_task/features/domain/usecases/add_task_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/delete_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/get_all_tasks.dart';
import 'package:my_daily_task/features/domain/usecases/get_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/init_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/open_database_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/trun_off_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/update_usecase.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final AddTaskUseCase addTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final GetAllTaskUseCase getAllTaskUseCase;
  final GetNotificationUseCase getNotificationUseCase;
  final OpenDatabaseUseCase openDatabaseUseCase;
  final TurnOnNotificationUseCase turnOnNotificationUseCase;
  final UpdateUseCase updateUseCase;
  final InitNotificationUseCase initNotificationUseCase;

  TaskCubit({
    this.addTaskUseCase,
    this.deleteTaskUseCase,
    this.getAllTaskUseCase,
    this.getNotificationUseCase,
    this.openDatabaseUseCase,
    this.turnOnNotificationUseCase,
    this.updateUseCase,
    this.initNotificationUseCase,
  }) : super(TaskInitialState());


  Future<void> initNotification()async{
    try{
      await initNotificationUseCase.call();
    }catch(_){
      //FIXME:emit(failureState());
    }
  }

  Future<void> addNewTask({TaskEntity task})async{
    try{
     await addTaskUseCase.call(task);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }
  Future<void> deleteTask({TaskEntity task})async{
    try{
      await deleteTaskUseCase.call(task);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }
  Future<void> getAllTask()async{
    emit(TaskLoadingState());
    try{
      final taskData=await getAllTaskUseCase.call();
      emit(TaskLoadedState(taskData: taskData));
    }catch(_){
      emit(TaskFailureState());
    }
  }
  Future<void> openDatabase()async{
    try{
      await openDatabaseUseCase.call();
    }catch(_){
      //FIXME:emit(failureState());
    }
  }

  Future<void> getNotification({TaskEntity task})async{
    try{
      await getNotificationUseCase.call(task);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }
  Future<void> turnOnNotification({TaskEntity task})async{
    try{
      await turnOnNotificationUseCase.call(task);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }
  Future<void> updateTask({TaskEntity task})async{
    try{
      await updateUseCase.call(task);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }


}
