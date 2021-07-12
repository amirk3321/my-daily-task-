import 'package:flutter/material.dart';
import 'package:my_daily_task/features/presentation/screens/home_screen.dart';
import 'package:my_daily_task/on_generate_route.dart';
import 'injection_container.dart' as sl;


void main() async{
  //await sl.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Daily Tasks',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent
      ),
      onGenerateRoute: OnGenerateRoute.route,
      routes: {
        "/":(context){
          return HomeScreen();
        }
      },
    );
  }
}
