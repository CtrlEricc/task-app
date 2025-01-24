import 'package:drift/drift.dart';
import 'package:task_app/data/datasources/local/local_database.dart';
import 'package:task_app/domain/entities/task_entity.dart';
import 'package:task_app/domain/models/task_model.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskEntity])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Future<List<TaskModel>> getAllTasks() async {
    final result = await select(taskEntity).get();
    return result.map((e) => e.toTaskModel()).toList();
  }

  Future<int> insertTask(TaskModel task) =>
      into(taskEntity).insert(task.toEntityCompanion(), mode: InsertMode.insertOrIgnore);

  Future<int> updateTask(TaskModel task) async {
    final updateStatement = update(taskEntity)..where((row) => row.id.equals(task.id!));
    return await updateStatement.write(task.toEntityCompanion());
  }

  Future<int> deleteTask(String id) => (delete(taskEntity)..where((task) => task.id.equals(id))).go();
}
