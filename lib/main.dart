import 'package:ayachi_biblio/screens/page_de_menu.dart';
import 'package:ayachi_biblio/screens/page_de_garde.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'screens/page_de_livre.dart';
import 'screens/a_propos.dart';
import 'screens/aime.dart';
import 'screens/contact_me.dart';
import 'screens/lien.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageGarde(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ElementsPourMenu currentItem = ElementsMenu.livres;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      angle: 0.0,
      borderRadius: 40,
      showShadow: true,
      backgroundColor: Colors.white54,
      slideWidth: MediaQuery.of(context).size.width * 0.45,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => PageMenu(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
    );
  }

  getScreen() {
    switch (currentItem) {
      case ElementsMenu.livres:
        return PageLivre();
      case ElementsMenu.aime:
        return Aime();
      case ElementsMenu.lien:
        return Lien();
      case ElementsMenu.a_propos:
        return APropos();
      case ElementsMenu.contact_me:
        return ContactMe();
    }
  }
}
