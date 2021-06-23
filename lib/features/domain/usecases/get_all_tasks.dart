

import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class GetAllTaskUseCase{
  final LocalRepository localRepository;

  GetAllTaskUseCase({this.localRepository});

  Future<List<TaskEntity>> call(){
    return localRepository.getAllTasks();
  }
}