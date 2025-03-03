import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollScreen(),
    );
  }
}

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  _ScrollScreenState createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  List<Color> colors = List.generate(200, (index) {
    final random = Random();
    return Color.fromARGB(
      100,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  });

  void changeColor(int index) {
    setState(() {
      final random = Random();
      colors[index] = Color.fromARGB(
        100,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(200, (index) {
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
          final icon = icons[Random().nextInt(icons.length)];

          return GestureDetector(
            onTap: () => changeColor(index),
            child: Container(
              color: colors[index],
              child: ListTile(
                leading: Icon(icon),
                title: Text('List Item $index'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
