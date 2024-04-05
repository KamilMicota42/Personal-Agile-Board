import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../settings/routes/app_router.gr.dart';
import '../../utils/const/app_enums.dart';
import '../../utils/models/task_model.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/main_drawer.dart';

@RoutePage()
class ArchivedScreen extends StatefulWidget {
  const ArchivedScreen({super.key});

  @override
  State<ArchivedScreen> createState() => _ArchivedScreenState();
}

class _ArchivedScreenState extends State<ArchivedScreen> {
  List<TaskModel> tasks = [
    const TaskModel(taskId: "1", taskName: "TaskName", taskDescription: "Task Description that should ", taskStatus: TaskStatusEnums.open),
    const TaskModel(taskId: "2", taskName: "TaskName", taskDescription: "Task Description that should be ", taskStatus: TaskStatusEnums.inprogress),
    const TaskModel(taskId: "3", taskName: "TaskName", taskDescription: "Task Description that should be prob ", taskStatus: TaskStatusEnums.fixed),
    const TaskModel(taskId: "4", taskName: "TaskName", taskDescription: "Task Description be longer", taskStatus: TaskStatusEnums.open),
    const TaskModel(taskId: "5", taskName: "TaskName", taskDescription: "Task Description th be prob longer than", taskStatus: TaskStatusEnums.open),
    const TaskModel(taskId: "6", taskName: "TaskName", taskDescription: "Task Description that should than name", taskStatus: TaskStatusEnums.open),
    const TaskModel(taskId: "7", taskName: "TaskName", taskDescription: "Task Description that should er than", taskStatus: TaskStatusEnums.archived),
    const TaskModel(taskId: "8", taskName: "TaskName", taskDescription: "Task Description that ", taskStatus: TaskStatusEnums.archived),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(appBarTitle: "Archived"),
      drawer: const MainDrawer(),
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
        itemCount: tasks.length,
        padding: const EdgeInsets.only(top: 12, bottom: 24),
        itemBuilder: (context, index) {
          if (tasks[index].taskStatus == TaskStatusEnums.fixed || tasks[index].taskStatus == TaskStatusEnums.archived) {
            return InkWell(
              onTap: () {
                getIt<AppRouter>().navigate(EditTaskRoute(
                  taskName: tasks[index].taskName,
                  taskDescription: tasks[index].taskDescription,
                  taskStatus: tasks[index].taskStatus,
                ));
              },
              child: Card(
                color: Colors.black12,
                child: SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tasks[index].taskName.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(tasks[index].taskDescription.toString(), style: const TextStyle(color: Colors.white), overflow: TextOverflow.fade),
                        const Expanded(child: SizedBox()),
                        Text(
                          tasks[index].taskStatus?.value != null ? tasks[index].taskStatus!.value : TaskStatusEnums.open.value,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          getIt<AppRouter>().navigate(EditTaskRoute());
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
