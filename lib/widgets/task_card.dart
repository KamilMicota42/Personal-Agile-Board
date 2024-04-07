import 'package:default_project_architecture/presentation/cubit/cubit/tasks_cubit.dart';
import 'package:flutter/material.dart';

import '../settings/injection.dart';
import '../settings/routes/app_router.dart';
import '../settings/routes/app_router.gr.dart';
import '../utils/const/enums/task_enums.dart';
import '../utils/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final bool changeToDoneOnClick;
  const TaskCard({
    required this.task,
    required this.changeToDoneOnClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: InkWell(
        onTap: () {
          getIt<AppRouter>().navigate(EditTaskRoute(
            taskUuid: task.taskId,
            taskName: task.taskName,
            taskDescription: task.taskDescription,
            taskStatus: task.taskStatus,
          ));
        },
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.taskName.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text(task.taskDescription.toString(), style: const TextStyle(color: Colors.white), overflow: TextOverflow.clip, maxLines: 2),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Text(
                      task.taskStatus != null ? task.taskStatus!.value : TaskStatusEnums.open.value,
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.fade,
                    ),
                    const Spacer(),
                    changeToDoneOnClick
                        ? IconButton(
                            icon: const Icon(Icons.check_outlined),
                            color: Colors.white,
                            onPressed: () {
                              getIt<TasksCubit>().editTask(task.taskId, task.copyWith(taskId: task.taskId, taskStatus: TaskStatusEnums.fixed));
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.restore_outlined),
                            color: Colors.white,
                            onPressed: () {
                              getIt<TasksCubit>().editTask(task.taskId, task.copyWith(taskId: task.taskId, taskStatus: TaskStatusEnums.open));
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
