// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/enums/task_type_enum.dart';
import 'package:task_app/domain/models/task_model.dart';
import 'package:task_app/ui/core/widgets/custom_toast.dart';

class AddTaskViewmodel extends ChangeNotifier {
  final TaskRepository _taskRepository;

  AddTaskViewmodel(this._taskRepository);

  bool isLoading = false;

  String? selectedTaskType;

  final nameTextController = TextEditingController();

  void _cleanFields() {
    selectedTaskType = null;
    nameTextController.clear();
  }

  Future<void> addTask(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await _taskRepository.addTask(
        TaskModel(
          name: nameTextController.text,
          type: TaskTypeEnum.fromNameString(selectedTaskType),
        ),
      );

      isLoading = false;
      notifyListeners();

      _cleanFields();

      Navigator.of(context).pop(true);
    } catch (e) {
      isLoading = false;
      notifyListeners();

      CustomToast.show(context, 'Erro ao adicionar tarefa. Tente novamente', isSuccess: false);
    }
    notifyListeners();
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    return null;
  }
}
