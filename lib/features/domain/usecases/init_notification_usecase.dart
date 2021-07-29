

import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class InitNotificationUseCase{
  final LocalRepository localRepository;

  InitNotificationUseCase({this.localRepository});

  Future<void> call(){
    return localRepository.initNotification();
  }
}