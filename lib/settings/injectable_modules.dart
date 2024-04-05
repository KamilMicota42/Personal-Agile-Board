import 'package:default_project_architecture/presentation/cubit/cubit/tasks_cubit.dart';
import 'package:default_project_architecture/services/hive_api.dart';
import 'package:injectable/injectable.dart';

import 'routes/app_router.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AppRouter get router => AppRouter();

  @lazySingleton
  HiveApi get hiveApi => HiveApi();

  @lazySingleton
  TasksCubit get tasksCubit => TasksCubit();
}
