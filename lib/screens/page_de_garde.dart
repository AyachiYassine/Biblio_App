import 'package:flutter/material.dart';

import '../widgets/bouton_arr.dart';

class PageGarde extends StatelessWidget {
  const PageGarde({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/biblioo.png",
                  ),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black38, BlendMode.darken),
                ),
              ),
            ),
            SafeArea(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: [
                    Spacer(flex: 5),
                    Stack(children: <Widget>[
                      Text(" AYACHI BIBLIO",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 20
                              ..color = Colors.blue[800]!,
                          )),
                      Text(" AYACHI BIBLIO",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          )),
                    ]),
                    Spacer(flex: 20),
                    BoutonArr(
                      butonNom: 'Entrer',
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
