// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:default_project_architecture/presentation/screens/agile_board_screen.dart'
    as _i1;
import 'package:default_project_architecture/presentation/screens/archived_screen.dart'
    as _i2;
import 'package:default_project_architecture/presentation/screens/edit_task_screen.dart'
    as _i3;
import 'package:default_project_architecture/presentation/screens/todo_screen.dart'
    as _i4;
import 'package:default_project_architecture/utils/const/enums/task_enums.dart'
    as _i7;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AgileBoardRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i1.AgileBoardScreen()),
      );
    },
    ArchivedRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ArchivedScreen(),
      );
    },
    EditTaskRoute.name: (routeData) {
      final args = routeData.argsAs<EditTaskRouteArgs>(
          orElse: () => const EditTaskRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditTaskScreen(
          key: args.key,
          taskUuid: args.taskUuid,
          taskName: args.taskName,
          taskDescription: args.taskDescription,
          taskStatus: args.taskStatus,
        ),
      );
    },
    TodoRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i4.TodoScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AgileBoardScreen]
class AgileBoardRoute extends _i5.PageRouteInfo<void> {
  const AgileBoardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AgileBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgileBoardRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ArchivedScreen]
class ArchivedRoute extends _i5.PageRouteInfo<void> {
  const ArchivedRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ArchivedRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArchivedRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditTaskScreen]
class EditTaskRoute extends _i5.PageRouteInfo<EditTaskRouteArgs> {
  EditTaskRoute({
    _i6.Key? key,
    String? taskUuid,
    String? taskName,
    String? taskDescription,
    _i7.TaskStatusEnums? taskStatus,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          EditTaskRoute.name,
          args: EditTaskRouteArgs(
            key: key,
            taskUuid: taskUuid,
            taskName: taskName,
            taskDescription: taskDescription,
            taskStatus: taskStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTaskRoute';

  static const _i5.PageInfo<EditTaskRouteArgs> page =
      _i5.PageInfo<EditTaskRouteArgs>(name);
}

class EditTaskRouteArgs {
  const EditTaskRouteArgs({
    this.key,
    this.taskUuid,
    this.taskName,
    this.taskDescription,
    this.taskStatus,
  });

  final _i6.Key? key;

  final String? taskUuid;

  final String? taskName;

  final String? taskDescription;

  final _i7.TaskStatusEnums? taskStatus;

  @override
  String toString() {
    return 'EditTaskRouteArgs{key: $key, taskUuid: $taskUuid, taskName: $taskName, taskDescription: $taskDescription, taskStatus: $taskStatus}';
  }
}

/// generated route for
/// [_i4.TodoScreen]
class TodoRoute extends _i5.PageRouteInfo<void> {
  const TodoRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
