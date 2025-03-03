import 'dart:math';

import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: List.generate(200, (index) {

              final random = Random();
              final color = Color.fromARGB(
                100,
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
              );

              final icons = [
                Icons.star,
                Icons.hail,
                Icons.favorite,
                Icons.align_horizontal_center,
                Icons.home,
                Icons.person,
                Icons.settings,
                Icons.abc,
              ];
              final icon = icons[random.nextInt(icons.length)];

              return  Container(
                color: color,
                child: ListTile(
                  leading: Icon(icon),
                  title: Text('List Item $index'),
                ),
              );
            },
            ),
          ),
          );
  }
}