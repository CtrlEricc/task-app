import 'package:drift/drift.dart';
import 'package:task_app/data/datasources/local/local_database.dart';
import 'package:task_app/domain/enums/task_type_enum.dart';
import 'package:uuid/uuid.dart';

class TaskModel {
  String? id;
  String? name;
  String? description;
  String? dateTimeIsoString;
  TaskTypeEnum? type;
  bool? isCompleted;

  TaskModel({
    this.id,
    this.name,
    this.description,
    this.dateTimeIsoString,
    this.type,
    this.isCompleted,
  });

  TaskModel copyWith({
    String? id,
    String? name,
    String? description,
    String? dateTimeIsoString,
    TaskTypeEnum? type,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      dateTimeIsoString: dateTimeIsoString ?? this.dateTimeIsoString,
      type: type ?? this.type,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  TaskEntityCompanion toEntityCompanion() {
    var uuid = Uuid();
    return TaskEntityCompanion(
      id: Value(id ?? uuid.v1()),
      name: Value(name),
      description: Value(description),
      dateTimeIsoString: Value(dateTimeIsoString),
      type: Value(type?.value),
      isCompleted: Value(isCompleted ?? false),
    );
  }
}

extension TaskExtension on Task {
  TaskModel toTaskModel() {
    return TaskModel(
      id: id,
      name: name,
      description: description,
      dateTimeIsoString: dateTimeIsoString,
      type: TaskTypeEnum.fromValueString(type),
      isCompleted: isCompleted,
    );
  }
}
