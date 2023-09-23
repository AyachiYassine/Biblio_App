import 'package:flutter/material.dart';

import '../widgets/aff_page_de_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: AffMenu(),
        title: Text("Contact me"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\n\n\t\t\t\tCliquez pour Trouver moi sur \n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tLinkedIn : \n\n\t\t\t\t\t\t\t\t\t\t\t\t\t@AYACHI_BIBLIO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/linkedin_icon.png",
                  width: 70,
                  height: 70,
                ),
                onTap: () async {
                  final Uri _url = Uri.parse('https://www.linkedin.com/');
                  if (!await launchUrl(_url)) {
                    throw 'could not launch $_url';
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
