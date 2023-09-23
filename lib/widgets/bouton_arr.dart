import 'package:ayachi_biblio/main.dart';
import 'package:flutter/material.dart';

class BoutonArr extends StatelessWidget {
  const BoutonArr({
    Key? key,
    required this.butonNom,
  }) : super(key: key);

  final String butonNom;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
          child: Text(
            butonNom,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                height: 1.5,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
