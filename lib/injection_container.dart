import 'package:get_it/get_it.dart';
import 'package:my_daily_task/features/data/local_data_source/local_data_source.dart';
import 'package:my_daily_task/features/data/local_data_source/local_data_source_impl.dart';
import 'package:my_daily_task/features/data/repositories/local_repsoitory_impl.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';
import 'package:my_daily_task/features/domain/usecases/add_task_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/delete_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/get_all_tasks.dart';
import 'package:my_daily_task/features/domain/usecases/get_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/init_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/init_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/open_database_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/trun_off_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/update_usecase.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //bloc/Cubit
  sl.registerFactory<TaskCubit>(() => TaskCubit(
    getNotificationUseCase: sl.call(),
    deleteTaskUseCase: sl.call(),
    addTaskUseCase: sl.call(),
    getAllTaskUseCase: sl.call(),
    openDatabaseUseCase: sl.call(),
    turnOnNotificationUseCase: sl.call(),
    updateUseCase: sl.call(),
    initNotificationUseCase: sl.call(),
  ));

  //UseCases
  sl.registerLazySingleton<InitNotificationUseCase>(
          () => InitNotificationUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<DeleteTaskUseCase>(
          () => DeleteTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetAllTaskUseCase>(
          () => GetAllTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetNotificationUseCase>(
          () => GetNotificationUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<OpenDatabaseUseCase>(
          () => OpenDatabaseUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<TurnOnNotificationUseCase>(
          () => TurnOnNotificationUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<UpdateUseCase>(
          () => UpdateUseCase(localRepository: sl.call()));

  //Repository
  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localDataSource: sl.call()));

  //RemoteDataSource
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  //External
}
