import 'package:default_project_architecture/settings/injection.dart';
import 'package:default_project_architecture/settings/routes/app_router.dart';
import 'package:default_project_architecture/settings/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              child: Text(
                'Personal agile board',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Todo list',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: getIt<AppRouter>().current.name == "TodoRoute" ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const Icon(Icons.assignment_outlined, color: Colors.white),
              ],
            ),
            onTap: () {
              getIt<AppRouter>().replace(const TodoRoute());
            },
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Agile board',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.view_week_outlined, color: Colors.white),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Archived',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: getIt<AppRouter>().current.name == "ArchivedRoute" ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const Icon(Icons.archive_outlined, color: Colors.white),
              ],
            ),
            onTap: () {
              getIt<AppRouter>().replace(const ArchivedRoute());
            },
          ),
        ],
      ),
    );
  }
}
