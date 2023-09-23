import 'package:ayachi_biblio/models/livre.dart';
import 'package:flutter/material.dart';
import '../show_pdf/view_pdf.dart';

class Information extends StatefulWidget {
  final Livre lvr;

  const Information({Key? key, required this.lvr}) : super(key: key);

  @override
  State<Information> createState() => _InformationStatement();
}

class _InformationStatement extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 440,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 60,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            spreadRadius: 5,
                                            blurRadius: 5,
                                            offset: Offset(4, 4))
                                      ]),
                                      child: Image(
                                        height: Image(
                                                image: AssetImage(
                                                    widget.lvr.image))
                                            .height,
                                        image: AssetImage(widget.lvr.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      widget.lvr.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      widget.lvr.publisher,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.lvr.description,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.lvr.chapters,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blueGrey[900],
                        ),
                        child: GestureDetector(
                          onTap: (() {
                            setState(() {
                              widget.lvr.like = !widget.lvr.like;
                            });
                          }),
                          child: Icon(
                            widget.lvr.like ? Icons.favorite : Icons.favorite,
                            size: 28,
                            color: widget.lvr.like ? Colors.pink : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.brown,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => view_pdf(
                                        lvr: widget.lvr,
                                      )),
                            );
                          },
                          child: Text(
                            "Ouvrir le fichier",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
