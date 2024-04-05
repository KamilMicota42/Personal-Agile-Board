import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const MainAppBar({
    required this.appBarTitle,
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
    );
  }
}
