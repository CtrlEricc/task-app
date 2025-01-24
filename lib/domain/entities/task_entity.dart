import 'package:drift/drift.dart';

@DataClassName('Task')
class TaskEntity extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get dateTimeIsoString => text().nullable()();
  TextColumn get type => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
