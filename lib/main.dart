import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_app/data/datasources/local/dao/task_dao.dart';
import 'package:task_app/data/datasources/local/local_database.dart';
import 'package:task_app/routes.dart';
import 'package:task_app/ui/add_task/view_model/add_task_viewmodel.dart';
import 'package:task_app/ui/core/themes/theme.dart';
import 'package:task_app/ui/home/view_model/home_viewmodel.dart';
import 'data/repositories/task_repository.dart';

void main() {
  // database
  final database = AppDatabase();
  //daos
  final taskDao = TaskDao(database);
  // repositories
  final taskRepository = TaskRepository(taskDao);

  runApp(TaskApp(taskRepository: taskRepository));
}

class TaskApp extends StatelessWidget {
  final TaskRepository taskRepository;

  const TaskApp({required this.taskRepository, super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(taskRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => AddTaskViewmodel(taskRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task App',
        theme: appTheme,
        initialRoute: '/',
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
