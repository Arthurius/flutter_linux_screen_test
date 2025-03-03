import 'package:flutter/material.dart';
import 'package:flutter_linux_screen_test/draw/draw_screen.dart';
import 'package:flutter_linux_screen_test/gesture/gesture_screen.dart';
import 'package:flutter_linux_screen_test/scroll/scroll_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0088CD)),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.draw)),
                Tab(icon: Icon(Icons.gesture)),
              ],
            ),
            title: const Text('Linux Screen Tester'),
          ),
          body: const TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ScrollScreen(),
              DrawScreen(),
              GestureScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
