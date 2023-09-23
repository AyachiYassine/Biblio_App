import 'package:flutter/material.dart';
import '../widgets/aff_page_de_menu.dart';

class APropos extends StatelessWidget {
  const APropos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: AffMenu(),
        title: Text(
          "À Propos",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\n                 AYACHI BIBLIO \n\n         LIVRES POUR ÉTUDIER\n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Cette application est ici dans un but éducatif pour aider les futurs lauréats à atteindre leurs objectifs. L'application contient des sources pour étudier, et il y a aussi un lien vers un autre archive. Je vous souhaite un très bon courage. \n\n\t\t                             😊",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
