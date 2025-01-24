// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:task_app/ui/add_task/widgets/add_task_screen.dart';
import 'package:task_app/ui/home/widgets/home_screen.dart';
import 'package:task_app/ui/splash/widgets/splash_screen.dart';

typedef PageBuilder = Widget Function(BuildContext context, dynamic _);

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const ADD_TASK = '/add_task';

  Routes._();

  static Map<String, PageBuilder> get getRoutes {
    return {
      SPLASH: (context, _) => const SplashScreen(),
      HOME: (context, _) => HomeScreen(),
      ADD_TASK: (context, _) => AddTaskScreen(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final routeArgs = settings.arguments;
    final navigateTo = getRoutes[routeName];

    return MaterialPageRoute(
      builder: (context) => navigateTo!.call(context, routeArgs),
      settings: settings,
    );
  }
}
