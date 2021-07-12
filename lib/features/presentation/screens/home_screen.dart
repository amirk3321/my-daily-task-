import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_daily_task/app_const.dart';
import 'package:my_daily_task/features/presentation/pages/add_new_task.dart';
import 'package:my_daily_task/features/presentation/pages/complete_task_page.dart';
import 'package:my_daily_task/features/presentation/pages/home_page.dart';
import 'package:my_daily_task/features/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final iconList = <IconData>[
    FontAwesome.home,
    FontAwesome.tasks
  ];
  List<Widget> get _pages =>[HomePage(),CompleteTaskPage()];
  int _pageNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: colorC80863,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        onPressed: (){
          Navigator.pushNamed(context, PageConst.addNewTaskPage);
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar:_bottomNavBar(),
      body: _pages[_pageNavIndex],
    );
  }

  Widget _bottomNavBar() {
    return AnimatedBottomNavigationBar(
      activeColor: color6FADE4,
      gapLocation: GapLocation.center,
      icons: iconList, activeIndex: _pageNavIndex, onTap: (index) {
      setState(() {
        _pageNavIndex = index;
      });
    },);
  }
}
