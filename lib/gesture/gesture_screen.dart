import 'package:flutter/material.dart';

class GestureScreen extends StatefulWidget {
  const GestureScreen();
  @override
  _GestureScreenState createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  List<String> gestures = [];

  void addGesture(String gesture) {
    setState(() {
      gestures.add(gesture);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touch Screen Test'),
      ),
      body: GestureDetector(
        onTap: () => addGesture('Tap'),
        onDoubleTap: () => addGesture('Double Tap'),
        onLongPress: () => addGesture('Long Press'),
        onPanUpdate: (details) => addGesture('Pan Update: ${details.localPosition}'),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: gestures.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(gestures[index]),
                );
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    gestures.clear();
                  });
                },
                child: Text('Clear'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}