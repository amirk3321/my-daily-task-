//initial
//failure
//loaded/success
//loading

part of 'task_cubit.dart';

abstract class TaskState extends Equatable{
  const TaskState();
}

class TaskInitialState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TaskLoadingState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TaskLoadedState extends TaskState{
  final List<TaskEntity> taskData;

  TaskLoadedState({this.taskData});
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class TaskFailureState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
