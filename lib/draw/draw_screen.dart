import 'package:flutter/material.dart';


class DrawScreen extends StatefulWidget {
  const DrawScreen();
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  List<Offset> points = [];
  Offset? currentPoint;

  void clearDrawing() {
    setState(() {
      points.clear();
      currentPoint = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   floatingActionButton: FloatingActionButton(onPressed: () => clearDrawing(), child: Icon(Icons.delete)),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(details.localPosition);
            currentPoint = details.localPosition;
          });
        },
        onPanEnd: (details) {
          setState(() {
            points.add(Offset.zero);
            currentPoint = null;
          });
        },
        child: Stack(
          children: [
            CustomPaint(
              painter: DrawingPainter(points),
              child: Container(),
            ),
            if (currentPoint != null)
              Positioned(
                top: 10,
                right: 10,
                child: Text(
                  '(${currentPoint!.dx.toStringAsFixed(2)}, ${currentPoint!.dy.toStringAsFixed(2)})',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}