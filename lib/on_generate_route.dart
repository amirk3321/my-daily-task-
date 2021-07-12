






import 'package:flutter/material.dart';
import 'app_const.dart';
import 'features/presentation/pages/add_new_task.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.addNewTaskPage:{
        return materialBuilder(widget: AddNewTask());
      }
      default:
        return materialBuilder(
          widget: ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
