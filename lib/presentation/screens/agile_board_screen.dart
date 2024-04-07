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
class AgileBoardScreen extends StatefulWidget implements AutoRouteWrapper {
  const AgileBoardScreen({super.key});

  @override
  State<AgileBoardScreen> createState() => _AgileBoardScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    getIt<TasksCubit>().readTasks();
    return this;
  }
}

class _AgileBoardScreenState extends State<AgileBoardScreen> {
  ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBarTitle: "Agile board",
        actions: [
          IconButton(
            icon: const Icon(Icons.archive_outlined),
            color: Colors.white,
            onPressed: () {
              _askToArchivedAllTasks();
            },
          )
        ],
      ),
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
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: TaskStatusEnums.values.length,
            padding: EdgeInsetsDirectional.zero,
            controller: sc,
            itemBuilder: (context, currTaskStatus) {
              return TaskStatusEnums.values[currTaskStatus] != TaskStatusEnums.archived
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: DragTarget<TaskModel>(
                          onAcceptWithDetails: (task) {
                            getIt<TasksCubit>().editTask(
                                task.data.taskId, task.data.copyWith(taskId: task.data.taskId, taskStatus: TaskStatusEnums.values[currTaskStatus]));
                          },
                          builder: (context, candidateData, rejectedData) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                width: 300,
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: tasks.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, currTask) {
                                    return (tasks[currTask].taskStatus == TaskStatusEnums.values[currTaskStatus])
                                        ? Listener(
                                            onPointerMove: (event) {
                                              if (event.position.dx < MediaQuery.of(context).size.width / 4) {
                                                sc.jumpTo(sc.offset - 10);
                                              }
                                              if (event.position.dx > MediaQuery.of(context).size.width / 4) {
                                                sc.jumpTo(sc.offset + 10);
                                              }
                                            },
                                            child: LongPressDraggable<TaskModel>(
                                              delay: const Duration(milliseconds: 100),
                                              data: tasks[currTask],
                                              feedback: TaskCard(
                                                task: tasks[currTask],
                                              ),
                                              childWhenDragging: TaskCard(
                                                task: tasks[currTask],
                                              ),
                                              child: TaskCard(
                                                task: tasks[currTask],
                                              ),
                                            ),
                                          )
                                        : const SizedBox();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
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

  Future<void> _askToArchivedAllTasks() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Archived all tasks'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are You sure You want to archive all the tasks. All tasks available on this board will change status to archived. You will be able to still find them in Archived tab.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Archive'),
              onPressed: () {
                getIt<TasksCubit>().archiveAllTasks();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
