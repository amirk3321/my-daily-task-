import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_task/features/presentation/screens/home_screen.dart';
import 'package:my_daily_task/on_generate_route.dart';
import 'injection_container.dart' as di;


void main() async{
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (_) => di.sl<TaskCubit>()..openDatabase()..initNotification(),
      child: MaterialApp(
        title: 'My Daily Tasks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.indigoAccent
        ),
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/":(context){
            return HomeScreen();
          }
        },
      ),
    );
  }
}
