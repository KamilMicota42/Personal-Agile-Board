import 'package:flutter/material.dart';

import '../settings/injection.dart';
import '../settings/routes/app_router.dart';
import '../settings/routes/app_router.gr.dart';
import '../utils/const/enums/task_enums.dart';
import '../utils/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({
    required this.task,
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
                    IconButton(
                      icon: const Icon(Icons.archive_outlined),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.check_outlined),
                      color: Colors.white,
                      onPressed: () {},
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
