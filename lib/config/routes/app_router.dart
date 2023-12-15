import 'package:flutter/material.dart';
import 'package:todo/core/helpers/fade_route_builder.dart';
import 'package:todo/ui/views/task_view/create/create_task_view.dart';
import 'package:todo/ui/views/login_view/login_view.dart';
import 'package:todo/ui/views/task_view/list/task_list_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const LoginView(),
      ),
      'taskList': MaterialPageRoute(
        builder: (_) => const TaskListView(),
      ),
      'createTask': FadeRouteBuilder(
        page: const CreateTaskView(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
