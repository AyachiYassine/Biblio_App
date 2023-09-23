import 'package:ayachi_biblio/models/livreur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/etagere_a_livres.dart';
import '../widgets/aff_page_de_menu.dart';

class Aime extends StatelessWidget {
  const Aime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        leading: AffMenu(),
        title: Text("Aimé"),
      ),
      body: Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
              itemCount: bibliotheque.where((Book) => Book.like == true).length,
              itemBuilder: (context, index) {
                List likedbooks =
                    bibliotheque.where((Book) => Book.like == true).toList();
                return Livreur(lvr: likedbooks[index]);
              },
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
