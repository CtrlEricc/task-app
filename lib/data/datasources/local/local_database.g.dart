// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $TaskEntityTable extends TaskEntity
    with TableInfo<$TaskEntityTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateTimeIsoStringMeta =
      const VerificationMeta('dateTimeIsoString');
  @override
  late final GeneratedColumn<String> dateTimeIsoString =
      GeneratedColumn<String>('date_time_iso_string', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, dateTimeIsoString, type, isCompleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date_time_iso_string')) {
      context.handle(
          _dateTimeIsoStringMeta,
          dateTimeIsoString.isAcceptableOrUnknown(
              data['date_time_iso_string']!, _dateTimeIsoStringMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      dateTimeIsoString: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}date_time_iso_string']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
    );
  }

  @override
  $TaskEntityTable createAlias(String alias) {
    return $TaskEntityTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String? name;
  final String? description;
  final String? dateTimeIsoString;
  final String? type;
  final bool isCompleted;
  const Task(
      {required this.id,
      this.name,
      this.description,
      this.dateTimeIsoString,
      this.type,
      required this.isCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dateTimeIsoString != null) {
      map['date_time_iso_string'] = Variable<String>(dateTimeIsoString);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  TaskEntityCompanion toCompanion(bool nullToAbsent) {
    return TaskEntityCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dateTimeIsoString: dateTimeIsoString == null && nullToAbsent
          ? const Value.absent()
          : Value(dateTimeIsoString),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isCompleted: Value(isCompleted),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      dateTimeIsoString:
          serializer.fromJson<String?>(json['dateTimeIsoString']),
      type: serializer.fromJson<String?>(json['type']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'dateTimeIsoString': serializer.toJson<String?>(dateTimeIsoString),
      'type': serializer.toJson<String?>(type),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  Task copyWith(
          {String? id,
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> dateTimeIsoString = const Value.absent(),
          Value<String?> type = const Value.absent(),
          bool? isCompleted}) =>
      Task(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        dateTimeIsoString: dateTimeIsoString.present
            ? dateTimeIsoString.value
            : this.dateTimeIsoString,
        type: type.present ? type.value : this.type,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  Task copyWithCompanion(TaskEntityCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      dateTimeIsoString: data.dateTimeIsoString.present
          ? data.dateTimeIsoString.value
          : this.dateTimeIsoString,
      type: data.type.present ? data.type.value : this.type,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('dateTimeIsoString: $dateTimeIsoString, ')
          ..write('type: $type, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, dateTimeIsoString, type, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.dateTimeIsoString == this.dateTimeIsoString &&
          other.type == this.type &&
          other.isCompleted == this.isCompleted);
}

class TaskEntityCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String?> description;
  final Value<String?> dateTimeIsoString;
  final Value<String?> type;
  final Value<bool> isCompleted;
  final Value<int> rowid;
  const TaskEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.dateTimeIsoString = const Value.absent(),
    this.type = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskEntityCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.dateTimeIsoString = const Value.absent(),
    this.type = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? dateTimeIsoString,
    Expression<String>? type,
    Expression<bool>? isCompleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (dateTimeIsoString != null) 'date_time_iso_string': dateTimeIsoString,
      if (type != null) 'type': type,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskEntityCompanion copyWith(
      {Value<String>? id,
      Value<String?>? name,
      Value<String?>? description,
      Value<String?>? dateTimeIsoString,
      Value<String?>? type,
      Value<bool>? isCompleted,
      Value<int>? rowid}) {
    return TaskEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      dateTimeIsoString: dateTimeIsoString ?? this.dateTimeIsoString,
      type: type ?? this.type,
      isCompleted: isCompleted ?? this.isCompleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dateTimeIsoString.present) {
      map['date_time_iso_string'] = Variable<String>(dateTimeIsoString.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('dateTimeIsoString: $dateTimeIsoString, ')
          ..write('type: $type, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TaskEntityTable taskEntity = $TaskEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskEntity];
}

typedef $$TaskEntityTableCreateCompanionBuilder = TaskEntityCompanion Function({
  required String id,
  Value<String?> name,
  Value<String?> description,
  Value<String?> dateTimeIsoString,
  Value<String?> type,
  Value<bool> isCompleted,
  Value<int> rowid,
});
typedef $$TaskEntityTableUpdateCompanionBuilder = TaskEntityCompanion Function({
  Value<String> id,
  Value<String?> name,
  Value<String?> description,
  Value<String?> dateTimeIsoString,
  Value<String?> type,
  Value<bool> isCompleted,
  Value<int> rowid,
});

class $$TaskEntityTableFilterComposer
    extends Composer<_$AppDatabase, $TaskEntityTable> {
  $$TaskEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dateTimeIsoString => $composableBuilder(
      column: $table.dateTimeIsoString,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));
}

class $$TaskEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskEntityTable> {
  $$TaskEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dateTimeIsoString => $composableBuilder(
      column: $table.dateTimeIsoString,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));
}

class $$TaskEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskEntityTable> {
  $$TaskEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get dateTimeIsoString => $composableBuilder(
      column: $table.dateTimeIsoString, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);
}

class $$TaskEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskEntityTable,
    Task,
    $$TaskEntityTableFilterComposer,
    $$TaskEntityTableOrderingComposer,
    $$TaskEntityTableAnnotationComposer,
    $$TaskEntityTableCreateCompanionBuilder,
    $$TaskEntityTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TaskEntityTable, Task>),
    Task,
    PrefetchHooks Function()> {
  $$TaskEntityTableTableManager(_$AppDatabase db, $TaskEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> dateTimeIsoString = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaskEntityCompanion(
            id: id,
            name: name,
            description: description,
            dateTimeIsoString: dateTimeIsoString,
            type: type,
            isCompleted: isCompleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> dateTimeIsoString = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TaskEntityCompanion.insert(
            id: id,
            name: name,
            description: description,
            dateTimeIsoString: dateTimeIsoString,
            type: type,
            isCompleted: isCompleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskEntityTable,
    Task,
    $$TaskEntityTableFilterComposer,
    $$TaskEntityTableOrderingComposer,
    $$TaskEntityTableAnnotationComposer,
    $$TaskEntityTableCreateCompanionBuilder,
    $$TaskEntityTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TaskEntityTable, Task>),
    Task,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TaskEntityTableTableManager get taskEntity =>
      $$TaskEntityTableTableManager(_db, _db.taskEntity);
}
