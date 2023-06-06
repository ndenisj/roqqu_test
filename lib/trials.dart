import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressWithBorder extends StatelessWidget {
  final double progress;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final Color progressColor;
  final double strokeThickness;

  const CircularProgressWithBorder({
    required this.progress,
    this.radius = 50,
    this.borderWidth = 2,
    this.borderColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.strokeThickness = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(
        painter: _CircularProgressWithBorderPainter(
          progress: progress,
          radius: radius,
          borderWidth: borderWidth,
          borderColor: borderColor,
          progressColor: progressColor,
          strokeThickness: strokeThickness,
        ),
        child: Center(
          child: Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressWithBorderPainter extends CustomPainter {
  final double progress;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final Color progressColor;
  final double strokeThickness;

  _CircularProgressWithBorderPainter({
    required this.progress,
    required this.radius,
    required this.borderWidth,
    required this.borderColor,
    required this.progressColor,
    required this.strokeThickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = radius * strokeThickness;

    // Draw the border circle
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawCircle(center, radius - borderWidth / 2, borderPaint);

    // Draw the progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - borderWidth / 2),
      -0.5 * pi,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressWithBorderPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        radius != oldDelegate.radius ||
        borderWidth != oldDelegate.borderWidth ||
        borderColor != oldDelegate.borderColor ||
        progressColor != oldDelegate.progressColor ||
        strokeThickness != oldDelegate.strokeThickness;
  }
}

////////
///
class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Progress'),
      ),
      body: Center(
        child: CircularProgressWithBorder(
          progress: progress,
          radius: 100,
          borderWidth: 4,
          borderColor: Colors.grey,
          progressColor: Colors.blue,
          strokeThickness: 0.2,
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        color: Colors.amber,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  progress += 0.25;
                });
              },
              icon: Icon(Icons.next_plan),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  progress -= 0.25;
                });
              },
              icon: Icon(Icons.next_plan_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
