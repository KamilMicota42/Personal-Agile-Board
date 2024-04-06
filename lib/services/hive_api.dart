import 'package:default_project_architecture/utils/const/enums/task_enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/models/task_model.dart';

class HiveApi {
  Future<void> initHive() async {
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(TaskStatusEnumsAdapter());
    await Hive.initFlutter();
    await Hive.openBox("tasks");
  }

  void saveData(TaskModel task, String boxName) {
    final box = Hive.box(boxName);
    box.put(task.taskId, task);
  }

  Box readData(String boxName) {
    final box = Hive.box(boxName);
    return box;
  }

  void deleteData() {}

  void editData(String boxName, String key, dynamic object) {
    final box = Hive.box(boxName);
    box.put(key, object);
  }
}
