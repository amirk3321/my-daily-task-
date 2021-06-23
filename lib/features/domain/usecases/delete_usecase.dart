

import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class DeleteTaskUseCase{
  final LocalRepository localRepository;

  DeleteTaskUseCase({this.localRepository});

  Future<void> call(TaskEntity task){
    return localRepository.deleteTask(task);
  }
}