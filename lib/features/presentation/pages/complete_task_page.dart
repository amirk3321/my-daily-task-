

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_task/features/domain/enitites/task_entity.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_task/features/presentation/widgets/common.dart';
import 'package:my_daily_task/features/presentation/widgets/theme/style.dart';

class CompleteTaskPage extends StatefulWidget {
  const CompleteTaskPage({Key key}) : super(key: key);

  @override
  _CompleteTaskPageState createState() => _CompleteTaskPageState();
}

class _CompleteTaskPageState extends State<CompleteTaskPage> {


  SlidableController _slideController=SlidableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit,TaskState>(
        builder: (context,taskState){
          if (taskState is TaskLoadedState){
           final completeTasks= taskState.taskData.where((element) => element.isCompleteTask==true).toList();
            return Column(
              children: [
                _headerWidget(completeTasks),
                completeTasks.isEmpty?Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 70,
                            child: Opacity(
                                opacity: .5,
                                child: Image.asset("assets/tasks.png"))),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "You do not have any task",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(.4)),
                        ),
                      ],
                    ),
                  ),
                ):_listTaskWidget(completeTasks),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      )
    );
  }

  _listTaskWidget(List<TaskEntity> task) {
    return Expanded(
      child: ListView.builder(
        itemCount: task.length,
        itemBuilder: (_, index) {
          return _listItem(task[index]);
        },
      ),
    );
  }

  _listItem(TaskEntity task) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          AwesomeDialog(
            context: context,
            borderSide: BorderSide(
                color: taskTypeListColor[0],
                width: 2),
            width: 280,
            buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
            headerAnimationLoop: true,
            animType: AnimType.TOPSLIDE,
            title: '${task.title}',
            desc:
            '${task.title}\n${DateFormat("hh:mm a").format(DateTime.parse(task.time))}',
            showCloseIcon: false,
            dialogType: DialogType.INFO,
            btnOkOnPress: () {},
          )..show();
        },
        child: Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 4,
                    decoration: BoxDecoration(
                        color:
                        taskTypeListColor[task.colorIndex],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: true == false
                            ? Colors.white
                            : Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border:
                        Border.all(color: Colors.grey[400])),
                    child: true == false
                        ? Icon(
                      Icons.done,
                      color: Colors.grey,
                    )
                        : Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${DateFormat("hh:mm a").format(DateTime.parse(task.time))}",
                    style: TextStyle(
                        color: Colors.black.withOpacity(.4)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: Text(
                        "${task.title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            decoration:
                            true == false
                                ? TextDecoration.none
                                : TextDecoration.lineThrough),
                      )),
                ],
              ),
              Text("")
            ],
          ),
        ),
      ),
    );
  }

  _headerWidget(List<TaskEntity> task) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.indigo,
          color6FADE4,
        ], end: Alignment.topLeft, begin: Alignment.topRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complete Tasks",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "You have Completed ${task.length} tasks",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  itemBuilder: (_)=> taskTypeList.map((value) {
                    return  PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }
                  ).toList(),
                  onSelected: (String value) {
                    //FIXME
                  },
                  child: Icon(
                    Icons.filter_list_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}