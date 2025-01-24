// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/data/mock_data.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/enums/task_type_enum.dart';
import 'package:task_app/domain/models/task_model.dart';
import 'package:task_app/ui/core/widgets/custom_toast.dart';
import 'package:task_app/utils/repository_exception.dart';

class HomeViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository;

  HomeViewModel(this._taskRepository);

  List<TaskModel> _tasks = [];

  List<TaskModel> get allTasks => _tasks;

  List<TaskModel> get personalTasks => _tasks.where((t) => t.type == TaskTypeEnum.PERSONAL).toList();

  List<TaskModel> get jobTasks => _tasks.where((t) => t.type == TaskTypeEnum.JOB).toList();

  List<TaskModel> get homeTasks => _tasks.where((t) => t.type == TaskTypeEnum.HOME).toList();

  bool isLoading = false;

  String? errorMessage;

  Future<void> initializeTasks(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final hasInitialized = prefs.getBool('hasInitializedTasks') ?? false;

    if (!hasInitialized) {
      await _getTasksFromJson(context);
      await prefs.setBool('hasInitializedTasks', true);
    } else {
      await getAllTasks(context);
    }
  }

  Future<void> _getTasksFromJson(BuildContext context) async {
    var jsonData = mockData['data'];
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      _tasks = await _taskRepository.addTasksFromJson(jsonData);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      errorMessage = e is RepositoryException ? e.message : 'Erro ao carregar tarefas. Tente novamente';
      CustomToast.show(context, errorMessage!, isSuccess: false);
    }
  }

  Future<void> getAllTasks(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _tasks = await _taskRepository.getAllTasks();
    } catch (e) {
      errorMessage = e is RepositoryException ? e.message : 'Erro inesperado ao buscar tarefas';
      CustomToast.show(context, errorMessage!, isSuccess: false);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleTaskStatus(TaskModel task, BuildContext context) async {
    errorMessage = null;
    notifyListeners();
    try {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted!);
      _tasks = await _taskRepository.updateTask(updatedTask);
    } catch (e) {
      errorMessage = e is RepositoryException ? e.message : 'Erro inesperado ao atualizar tarefa';
      CustomToast.show(context, errorMessage!, isSuccess: false);
    }
    notifyListeners();
  }

  Future<void> deleteTask(String id, BuildContext context) async {
    try {
      _tasks = await _taskRepository.deleteTask(id);
    } catch (e) {
      errorMessage = e is RepositoryException ? e.message : 'Erro inesperado ao atualizar tarefa';
      CustomToast.show(context, errorMessage!, isSuccess: false);
    }
    notifyListeners();
  }
}
