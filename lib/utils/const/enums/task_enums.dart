import 'package:hive/hive.dart';
part 'task_enums.g.dart';

@HiveType(typeId: 1)
enum TaskStatusEnums {
  @HiveField(1)
  open("Open"),
  @HiveField(2)
  inprogress("In progress"),
  @HiveField(3)
  fixed("Fixed"),
  @HiveField(4)
  archived("Archived");

  const TaskStatusEnums(this.value);
  final String value;
}

TaskStatusEnums parseTaskStatus(String value) {
  for (var i = 0; i < TaskStatusEnums.values.length; i++) {
    if (TaskStatusEnums.values[i].value.toLowerCase() == value.toLowerCase()) {
      return TaskStatusEnums.values[i];
    }
  }
  return TaskStatusEnums.open;
}
