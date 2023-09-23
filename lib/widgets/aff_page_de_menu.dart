import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AffMenu extends StatelessWidget {
  const AffMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(Icons.menu));
  }
}
