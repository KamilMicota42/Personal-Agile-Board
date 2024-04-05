import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../settings/routes/app_router.gr.dart';
import '../../utils/const/enums/task_enums.dart';
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
  List<TaskModel> tasks = [];

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
