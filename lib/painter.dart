import 'package:flutter/material.dart';
import 'dart:math';

class BatPainter extends CustomPainter {
  final double flapProgress;

  BatPainter(this.flapProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Define the bat's shape using a Path.
    final path = Path();

    // The central body
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.2,
        height: size.height * 0.2,
      ),
    );

    // The wings
    final wingControlPointOffset = sin(flapProgress * pi) * 20;
    path.moveTo(size.width * 0.5, size.height * 0.5);
    // Left wing
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.1,
      size.height * 0.5 + wingControlPointOffset,
    );
    path.lineTo(size.width * 0.0, size.height * 0.6 + wingControlPointOffset);
    path.lineTo(size.width * 0.1, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.5,
    );
    
    // Right wing
    path.moveTo(size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.3,
      size.width * 0.9,
      size.height * 0.5 + wingControlPointOffset,
    );
    path.lineTo(size.width * 1.0, size.height * 0.6 + wingControlPointOffset);
    path.lineTo(size.width * 0.9, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.5,
    );
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BatPainter oldDelegate) {
    return oldDelegate.flapProgress != flapProgress;
  }
}
class GhostPainter extends CustomPainter {
  final double floatProgress;

  GhostPainter(this.floatProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 0.8)
      ..style = PaintingStyle.fill;

    // Define the ghost's shape using a Path.
    final path = Path();

    // The head
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.4 + sin(floatProgress * pi) * 5),
        width: size.width * 0.4,
        height: size.height * 0.4,
      ),
    );

    // The body
    path.moveTo(size.width * 0.3, size.height * 0.6 + sin(floatProgress * pi) * 5);
    path.lineTo(size.width * 0.7, size.height * 0.6 + sin(floatProgress * pi) * 5);
    path.lineTo(size.width * 0.7, size.height * 0.9 + sin(floatProgress * pi) * 5);
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height,
      size.width * 0.5,
      size.height * 0.9 + sin(floatProgress * pi) * 5,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height,
      size.width * 0.3,
      size.height * 0.9 + sin(floatProgress * pi) * 5,
    );
    path.close();

    // The wavy bottom
    final waveHeight = size.height * 0.05;
    final waveCount = 5;
    for (int i = 0; i < waveCount; i++) {
      final startX = size.width * (0.3 + i * (0.4 / waveCount));
      final endX = size.width * (0.3 + (i + 1) * (0.4 / waveCount));
      final controlX = (startX + endX) / 2;
      final controlY = size.height * 0.9 + waveHeight * (i % 2 == 0 ? -1 : 1) + sin(floatProgress * pi) * 5;
      path.quadraticBezierTo(controlX, controlY, endX, size.height * 0.9 + sin(floatProgress * pi) * 5);
    }
    canvas.drawPath(path, paint);
    // The eyes
    final eyePaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.35 + sin(floatProgress * pi) * 5), size.width * 0.05, eyePaint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.35 + sin(floatProgress * pi) * 5), size.width * 0.05, eyePaint);
    }
    @override
    bool shouldRepaint(GhostPainter oldDelegate) {
      return oldDelegate.floatProgress != floatProgress;
    }
}