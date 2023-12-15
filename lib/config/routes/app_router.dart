import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo/ui/views/login_view/login_view.dart';
import 'package:todo/ui/views/task_view/list/task_list_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const LoginView(),
      ),
      'taskList': MaterialPageRoute(
        builder: (_) => const CupertinoScaffold(body: TaskListView()),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
