import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  MyAppBar({super.key, required this.title});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
