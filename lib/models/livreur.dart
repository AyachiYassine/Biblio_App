import 'package:ayachi_biblio/screens/information_livre.dart';
import 'package:flutter/material.dart';

import 'livre.dart';

class Livreur extends StatefulWidget {
  final Livre lvr;

  const Livreur({required this.lvr, Key? key}) : super(key: key);

  @override
  State<Livreur> createState() => _LivreurStatement();
}

class _LivreurStatement extends State<Livreur> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Information(
                    lvr: widget.lvr,
                  )),
        );
      }),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                        child: Center(
                            child: Image(
                      image: AssetImage(
                        widget.lvr.image,
                      ),
                      fit: BoxFit.cover,
                    ))),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.lvr.like = !widget.lvr.like;
                      });
                    },
                    icon:
                        Icon(widget.lvr.like ? Icons.favorite : Icons.favorite),
                    iconSize: 26,
                    color: widget.lvr.like ? Colors.pink : Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Center(
                  child: Text(
                    widget.lvr.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Center(
                  child: Text(
                    widget.lvr.publisher,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
