import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final List<Widget>? actions;
  const MainAppBar({
    required this.appBarTitle,
    this.actions,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text(appBarTitle),
      foregroundColor: Colors.white,
      actions: actions,
    );
  }
}
