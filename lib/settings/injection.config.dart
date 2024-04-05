// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:default_project_architecture/presentation/cubit/cubit/tasks_cubit.dart'
    as _i5;
import 'package:default_project_architecture/services/hive_api.dart' as _i4;
import 'package:default_project_architecture/settings/injectable_modules.dart'
    as _i6;
import 'package:default_project_architecture/settings/routes/app_router.dart'
    as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.AppRouter>(() => injectableModule.router);
    gh.lazySingleton<_i4.HiveApi>(() => injectableModule.hiveApi);
    gh.lazySingleton<_i5.TasksCubit>(() => injectableModule.tasksCubit);
    return this;
  }
}

class _$InjectableModule extends _i6.InjectableModule {}
