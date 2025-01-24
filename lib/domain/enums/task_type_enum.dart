// ignore_for_file: constant_identifier_names

enum TaskTypeEnum {
  PERSONAL('PERSONAL', 'Pessoal'),
  JOB('JOB', 'Trabalho'),
  HOME('HOME', 'Casa');

  final String value;
  final String name;

  const TaskTypeEnum(this.value, this.name);

  static TaskTypeEnum fromValueString(String? value) {
    return TaskTypeEnum.values.firstWhere((e) => e.value == value);
  }

  static TaskTypeEnum fromNameString(String? value) {
    return TaskTypeEnum.values.firstWhere((e) => e.name == value);
  }
}
