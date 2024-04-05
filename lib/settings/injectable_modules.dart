import 'package:injectable/injectable.dart';

import 'routes/app_router.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AppRouter get router => AppRouter();
}
