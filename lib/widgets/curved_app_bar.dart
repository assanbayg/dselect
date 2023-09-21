import 'package:flutter/material.dart';

import '../custom_shape.dart';

class CurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  CurvedAppBar({
    super.key,
    required this.title,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      centerTitle: true,
      flexibleSpace: ClipPath(
        clipper: Customshape(),
        child: Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
