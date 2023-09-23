import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/livreur.dart';
import '../models/etagere_a_livres.dart';
import '../widgets/aff_page_de_menu.dart';

class PageLivre extends StatelessWidget {
  const PageLivre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AffMenu(),
        backgroundColor: Colors.brown,
        title: Text("Archives"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
              itemCount: bibliotheque.length,
              itemBuilder: (context, index) {
                return Livreur(lvr: bibliotheque[index]);
              },
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
