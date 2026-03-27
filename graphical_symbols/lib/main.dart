import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawingScreen(),
    );
  }
}

class DrawingScreen extends StatelessWidget {
  const DrawingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Graphics in Flutter'),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: ShapePainter(),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Rectangle
    final rectPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      const Rect.fromLTWH(20, 50, 120, 80),
      rectPaint,
    );

    // Circle
    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      const Offset(200, 150),
      40,
      circlePaint,
    );

    // Line
    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      const Offset(20, 20),
      const Offset(200, 20),
      linePaint,
    );

    // Arc
    final arcPaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      const Rect.fromLTWH(20, 160, 100, 100),
      0,
      pi,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}