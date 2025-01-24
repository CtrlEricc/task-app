// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/routes.dart';
import 'package:task_app/ui/core/themes/colors.dart';
import 'package:task_app/ui/core/widgets/custom_toast.dart';
import 'package:task_app/ui/home/view_model/home_viewmodel.dart';
import 'package:task_app/ui/home/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<HomeViewModel>().initializeTasks(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Color(0xFFF9F5F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 25),
          child: ListView(
            children: [
              Text(
                'Task App',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (homeViewModel.allTasks.isEmpty) ...[
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_outlined,
                        size: 45,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Para começar, adicione tarefas no botão abaixo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else
                ListenableBuilder(
                    listenable: homeViewModel,
                    builder: (_, __) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            if (homeViewModel.jobTasks.isNotEmpty) ...[
                              Text(
                                'TRABALHO',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: colorD1A28B,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeViewModel.jobTasks.length,
                                itemBuilder: (context, index) {
                                  final task = homeViewModel.jobTasks[index];
                                  return TaskTile(
                                    title: task.name!,
                                    isCompleted: task.isCompleted!,
                                    onToggleValue: (_) => homeViewModel.toggleTaskStatus(task, context),
                                    onDelete: () => homeViewModel.deleteTask(task.id!, context),
                                  );
                                },
                              ),
                            ],
                            if (homeViewModel.personalTasks.isNotEmpty) ...[
                              Text(
                                'PESSOAL',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: colorD1A28B,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeViewModel.personalTasks.length,
                                itemBuilder: (context, index) {
                                  final task = homeViewModel.personalTasks[index];
                                  return TaskTile(
                                    title: task.name!,
                                    isCompleted: task.isCompleted!,
                                    onToggleValue: (_) => homeViewModel.toggleTaskStatus(task, context),
                                    onDelete: () => homeViewModel.deleteTask(task.id!, context),
                                  );
                                },
                              ),
                            ],
                            if (homeViewModel.homeTasks.isNotEmpty) ...[
                              Text(
                                'CASA',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: colorD1A28B,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeViewModel.homeTasks.length,
                                itemBuilder: (context, index) {
                                  final task = homeViewModel.homeTasks[index];
                                  return TaskTile(
                                    title: task.name!,
                                    isCompleted: task.isCompleted!,
                                    onToggleValue: (_) => homeViewModel.toggleTaskStatus(task, context),
                                    onDelete: () => homeViewModel.deleteTask(task.id!, context),
                                  );
                                },
                              ),
                            ],
                            const SizedBox(height: 50),
                          ],
                        ),
                      );
                    })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final addTaskIsSuccessful = await Navigator.pushNamed(context, Routes.ADD_TASK);
          if (addTaskIsSuccessful != null && addTaskIsSuccessful == true) {
            homeViewModel.getAllTasks(context);
            CustomToast.show(context, 'Tarefa adicionada com sucesso!', isSuccess: true);
          }
        },
        backgroundColor: Color(0xff393433),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
