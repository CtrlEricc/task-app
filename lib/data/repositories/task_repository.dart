import 'package:task_app/data/datasources/local/dao/task_dao.dart';
import 'package:task_app/domain/enums/task_type_enum.dart';
import 'package:task_app/domain/models/task_model.dart';
import 'package:task_app/utils/repository_exception.dart';

class TaskRepository {
  final TaskDao _dao;

  TaskRepository(this._dao);

  // function to add tasks in local db on initialization
  // it was simulating a API call
  Future<List<TaskModel>> addTasksFromJson(List<dynamic> jsonData) async {
    final taskList = jsonData.map((task) {
      return TaskModel(
        id: task['id'],
        name: task['name'],
        type: TaskTypeEnum.fromValueString(task['type']),
        isCompleted: task['isCompleted'],
      );
    }).toList();
    return await _addMultipleTasks(taskList);
  }

  Future<List<TaskModel>> _addMultipleTasks(List<TaskModel> tasks) async {
    for (final task in tasks) {
      await _dao.insertTask(task);
    }
    return await getAllTasks();
  }

  Future<List<TaskModel>> getAllTasks() async {
    try {
      return await _dao.getAllTasks();
    } catch (e) {
      throw RepositoryException('Erro ao buscar as tarefas: ${e.toString()}');
    }
  }

  Future<List<TaskModel>> addTask(TaskModel task) async {
    try {
      await _dao.insertTask(task);
      return await getAllTasks();
    } catch (e) {
      throw RepositoryException('Erro ao adicionar tarefa: ${e.toString()}');
    }
  }

  Future<List<TaskModel>> updateTask(TaskModel task) async {
    try {
      await _dao.updateTask(task);
      return await getAllTasks();
    } catch (e) {
      throw RepositoryException('Erro ao atualizar tarefa: ${e.toString()}');
    }
  }

  Future<List<TaskModel>> deleteTask(String id) async {
    try {
      await _dao.deleteTask(id);
      return await getAllTasks();
    } catch (e) {
      throw RepositoryException('Erro ao remover tarefa: ${e.toString()}');
    }
  }
}
