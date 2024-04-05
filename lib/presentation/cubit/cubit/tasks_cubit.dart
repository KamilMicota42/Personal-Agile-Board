import 'package:default_project_architecture/services/hive_api.dart';
import 'package:default_project_architecture/settings/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/models/task_model.dart';

part 'tasks_state.dart';
part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(const TasksState.initial());

  void readTasks() {
    emit(const TasksState.loading());
    try {
      List<TaskModel> tasks = [];
      List<dynamic> rawTasks = getIt<HiveApi>().readData("tasks").values.toList();
      for (var rawTask in rawTasks) {
        rawTask.runtimeType == TaskModel ? tasks.add(rawTask) : null;
      }
      emit(TasksState.success(tasks: tasks));
    } catch (e) {
      emit(TasksState.error(error: e.toString()));
    }
  }

  void addTask(TaskModel task) {
    try {
      getIt<HiveApi>().saveData(
        task,
        "tasks",
      );
      readTasks();
    } catch (e) {
      emit(TasksState.error(error: e.toString()));
    }
  }

  void editTask(TaskModel task) {
    try {
      getIt<HiveApi>().editData(task.taskId, task, "tasks");
      readTasks();
    } catch (e) {
      emit(TasksState.error(error: e.toString()));
    }
  }
}
