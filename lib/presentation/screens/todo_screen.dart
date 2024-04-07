import 'package:auto_route/auto_route.dart';
import 'package:default_project_architecture/presentation/cubit/cubit/tasks_cubit.dart';
import 'package:default_project_architecture/settings/routes/app_router.gr.dart';
import 'package:default_project_architecture/utils/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../utils/const/enums/task_enums.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/main_drawer.dart';
import '../../widgets/task_card.dart';

@RoutePage()
class TodoScreen extends StatefulWidget implements AutoRouteWrapper {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    getIt<TasksCubit>().readTasks();
    return this;
  }
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(appBarTitle: "Todo list"),
      drawer: const MainDrawer(),
      backgroundColor: Colors.blueGrey,
      body: BlocBuilder<TasksCubit, TasksState>(
        bloc: getIt<TasksCubit>(),
        builder: (context, state) {
          final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
          final errorText = state.maybeWhen(error: (errorText) => errorText, orElse: () => null);
          List<TaskModel> tasks = state.maybeWhen(success: (tasks) => tasks, orElse: () => []);
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (errorText != null) {
            return Center(
              child: Text(errorText),
            );
          }
          return ListView.builder(
            itemCount: tasks.length,
            padding: const EdgeInsets.only(top: 12, bottom: 120),
            itemBuilder: (context, index) {
              return (tasks[index].taskStatus == TaskStatusEnums.open || tasks[index].taskStatus == TaskStatusEnums.inprogress)
                  ? TaskCard(
                      task: tasks[index],
                      additionalButton: IconButton(
                        icon: const Icon(Icons.check_outlined),
                        color: Colors.white,
                        onPressed: () {
                          getIt<TasksCubit>()
                              .editTask(tasks[index].taskId, tasks[index].copyWith(taskId: tasks[index].taskId, taskStatus: TaskStatusEnums.fixed));
                        },
                      ),
                    )
                  : const SizedBox();
            },
          );
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
