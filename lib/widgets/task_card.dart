import 'package:flutter/material.dart';

import '../settings/injection.dart';
import '../settings/routes/app_router.dart';
import '../settings/routes/app_router.gr.dart';
import '../utils/const/enums/task_enums.dart';
import '../utils/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final Widget? additionalButton;
  const TaskCard({
    required this.task,
    this.additionalButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Card(
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
                    additionalButton != null ? additionalButton! : const SizedBox(),
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
