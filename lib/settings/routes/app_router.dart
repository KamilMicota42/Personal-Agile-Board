import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TodoRoute.page, initial: true),
        AutoRoute(page: ArchivedRoute.page),
        AutoRoute(page: EditTaskRoute.page),
      ];
}
