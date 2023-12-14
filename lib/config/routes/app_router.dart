import 'package:flutter/material.dart';
import 'package:todo/ui/views/home_view/home_view.dart';
import 'package:todo/ui/views/login_view/login_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(
        builder: (_) => const LoginView(),
      ),
      'home': MaterialPageRoute(
        builder: (_) => const HomeView(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
