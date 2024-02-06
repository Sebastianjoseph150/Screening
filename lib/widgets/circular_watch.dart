import 'dart:math' as math;
import 'package:flutter/material.dart';

class StopwatchPainter extends CustomPainter {
  final double progress;
  final int countdown;

  StopwatchPainter({required this.progress, required this.countdown});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - 20;
    final strokeWidth = 4.0;
    final double arcAngle = 2 * math.pi * progress;

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paint);

    final progressPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      arcAngle,
      false,
      progressPaint,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: countdown.toString(),
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
