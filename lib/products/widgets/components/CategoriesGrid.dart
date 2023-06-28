import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'CategoryImage.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Widget> cardsList = [
    CategoryImage(
      image: 'assets/images/user5.jpg',
      name: 'category1',
      id: 3.toString(),
    ),
    CategoryImage(
      image: 'assets/images/user5.jpg',
      name: 'category1',
      id: 3.toString(),
    ),
    CategoryImage(
      image: 'assets/images/user5.jpg',
      name: 'category1',
      id: 3.toString(),
    ),
  ];

  CategoriesGrid({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const AutoSizeText('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const AutoSizeText('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const AutoSizeText('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const AutoSizeText('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const AutoSizeText('Revolution, they...'),
        ),
      ],
    );
  }
}
