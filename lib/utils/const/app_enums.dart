enum TaskStatusEnums {
  open("Open"),
  inprogress("In progress"),
  fixed("Fixed"),
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
