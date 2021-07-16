import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_task/features/presentation/widgets/common.dart';
import 'package:my_daily_task/features/presentation/widgets/theme/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  SlidableController _slideController=SlidableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerWidget(),
          _listTaskWidget(),
        ],
      ),
    );
  }

  _headerWidget() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo,
            color6FADE4,
          ],
          end: Alignment.topLeft,
          begin: Alignment.topRight,
        ),
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
                      "My Daily Tasks",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Today you have 0 task",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  itemBuilder: (_) => taskTypeList.map((value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onSelected: (String value) {
                    //FIXME:
                  },
                  child: Icon(
                    Icons.filter_list_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          _currentTaskWidget(),
        ],
      ),
    );
  }

  _currentTaskWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white.withOpacity(.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Today Reminder",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Title",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${DateFormat("hh:mm a").format(DateTime.now())}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(height: 60, child: Image.asset('assets/bell_icon.png')),
        ],
      ),
    );
  }

  _listTaskWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
          itemBuilder: (_, index) {
            return _listItem();
          },
      ),
    );
  }

  _listItem() {
    return Slidable(
      controller: _slideController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      enabled: true,
      closeOnScroll: true,
      secondaryActions: [
        GestureDetector(
          onTap: () {
            //FIXME:Delete Task
          },
          child: FittedBox(
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    size: 16,
                    color: Colors.white,
                  ),
                  Text(
                    "Delete",
                    style: TextStyle(fontSize: 7, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
      child: Container(
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
              title: 'Title',
              desc:
              'title\n${DateFormat("hh:mm a").format(DateTime.now())}',
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
                          taskTypeListColor[0],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        //FIXME:update task
                      },
                      child: Container(
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
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${DateFormat("hh:mm a").format(DateTime.now())}",
                      style: TextStyle(
                          color: Colors.black.withOpacity(.4)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: Text(
                          "Title",
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
                GestureDetector(
                  onTap: () {
                    //FIXME:set notification
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      FontAwesome.bell,
                      color: true == false
                          ? Colors.grey
                          : Colors.deepOrange,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
