import 'package:flutter/material.dart';

class ElementsMenu {
  static const livres = ElementsPourMenu("Archives", Icons.book);
  static const aime = ElementsPourMenu("Aimé", Icons.favorite);
  static const lien = ElementsPourMenu("Lien", Icons.double_arrow_rounded);
  static const a_propos = ElementsPourMenu("À Propos", Icons.help);
  static const contact_me =
      ElementsPourMenu("Contact me", Icons.account_circle_rounded);

  static const all = <ElementsPourMenu>[
    livres,
    aime,
    lien,
    a_propos,
    contact_me
  ];
}

class ElementsPourMenu {
  final String title;
  final IconData icon;

  const ElementsPourMenu(this.title, this.icon);
}

class PageMenu extends StatelessWidget {
  final ElementsPourMenu currentItem;
  final ValueChanged<ElementsPourMenu> onSelectedItem;
  const PageMenu({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/biblio_img.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Text(
                        ' AYACHI_BIBLIO',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ...ElementsMenu.all.map(buildMenuItem).toList(),
            Spacer(
              flex: 9,
            ),
          ],
        )),
      );

  Widget buildMenuItem(ElementsPourMenu item) => ListTile(
        selected: currentItem == item,
        selectedTileColor: Colors.black12,
        minLeadingWidth: 20,
        leading: Icon(
          item.icon,
          color: Colors.white,
        ),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => onSelectedItem(item),
      );
}
