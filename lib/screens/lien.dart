import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/aff_page_de_menu.dart';

class Lien extends StatelessWidget {
  const Lien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        leading: AffMenu(),
        title: Text("Lien"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\n\nLien pour télécharger un autre archive, cliquez sur le bouton en bas :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri _url = Uri.parse('https://www.linkedin.com/');
                  if (!await launchUrl(_url)) {
                    throw 'could not launch $_url';
                  }
                },
                child: Text("Vers le lien"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
