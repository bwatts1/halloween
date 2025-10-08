import 'package:flutter/material.dart';
import 'dart:math';

class BatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    LeftEar().draw(canvas, center, paint);
    RightEar().draw(canvas, center, paint);
    BatBody().draw(canvas, center, paint);
    LeftWing().draw(canvas, center, paint);
    RightWing().draw(canvas, center, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LeftEar {
  void draw(Canvas canvas, Offset center, Paint paint) {
    final path = Path();

    // Left ear
    path.moveTo(center.dx - 20, center.dy - 40);
    path.quadraticBezierTo(center.dx - 25, center.dy - 70, center.dx - 10, center.dy - 40);

    canvas.drawPath(path, paint);
  }
}

class RightEar {
  void draw(Canvas canvas, Offset center, Paint paint) {
    final path = Path();

    // Right ear
    path.moveTo(center.dx + 20, center.dy - 40);
    path.quadraticBezierTo(center.dx + 25, center.dy - 70, center.dx + 10, center.dy - 40);

    canvas.drawPath(path, paint);
  }
}

class BatBody {
  void draw(Canvas canvas, Offset center, Paint paint) {
    final path = Path();

    path.moveTo(center.dx - 15, center.dy - 40);
    path.lineTo(center.dx - 15, center.dy);
    path.arcToPoint(
      Offset(center.dx + 15, center.dy),
      radius: const Radius.circular(15),
      clockwise: false,
    );
    path.lineTo(center.dx + 15, center.dy - 40);
    path.close();

    canvas.drawPath(path, paint);
  }
}

class LeftWing {
  void draw(Canvas canvas, Offset center, Paint paint) {
    final path = Path();

    // Left wing
    path.moveTo(center.dx - 15, center.dy - 30);
    path.quadraticBezierTo(center.dx - 80, center.dy - 10, center.dx - 90, center.dy + 20);
    path.quadraticBezierTo(center.dx - 85, center.dy + 50, center.dx - 40, center.dy + 40);
    path.lineTo(center.dx - 15, center.dy + 10);
    path.close();

    canvas.drawPath(path, paint);
  }
}

class RightWing {
  void draw(Canvas canvas, Offset center, Paint paint) {
    final path = Path();

    // Right wing
    path.moveTo(center.dx + 15, center.dy - 30);
    path.quadraticBezierTo(center.dx + 80, center.dy - 10, center.dx + 90, center.dy + 20);
    path.quadraticBezierTo(center.dx + 85, center.dy + 50, center.dx + 40, center.dy + 40);
    path.lineTo(center.dx + 15, center.dy + 10);
    path.close();

    canvas.drawPath(path, paint);
  }
}

class GhostPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bodyPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final eyePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final pupilPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    GhostBody().draw(canvas, size, bodyPaint);
    LeftEye().draw(canvas, center, eyePaint);
    RightEye().draw(canvas, center, eyePaint);
    LeftPupil().draw(canvas, center, pupilPaint);
    RightPupil().draw(canvas, center, pupilPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GhostBody {
  void draw(Canvas canvas, Size size, Paint paint) {
    final path = Path();

    final width = size.width;
    final height = size.height;

    final left = 0.0;
    final top = 0.0;
    final right = width;
    final bottom = height;

    path.moveTo(left, bottom * 0.7);
    path.lineTo(left, top + height * 0.3);
    path.quadraticBezierTo(left, top, left + width / 2, top);
    path.quadraticBezierTo(right, top, right, top + height * 0.3);
    path.lineTo(right, bottom * 0.7);

    // Bottom scallops
    const scallopCount = 4;
    final scallopWidth = width / scallopCount;
    for (int i = 0; i < scallopCount; i++) {
      final startX = right - (i * scallopWidth);
      final controlX = startX - scallopWidth / 2;
      final endX = startX - scallopWidth;
      path.quadraticBezierTo(
        controlX,
        bottom,
        endX,
        bottom * 0.7,
      );
    }

    path.close();
    canvas.drawPath(path, paint);
  }
}

class LeftEye {
  void draw(Canvas canvas, Offset center, Paint paint) {
    // Left eye
    canvas.drawCircle(
      Offset(center.dx - 20, center.dy - 10),
      10,
      paint,
    );
  }
}

class RightEye {
  void draw(Canvas canvas, Offset center, Paint paint) {
    // Right eye
    canvas.drawCircle(
      Offset(center.dx + 20, center.dy - 10),
      10,
      paint,
    );
  }
}

class LeftPupil {
  void draw(Canvas canvas, Offset center, Paint paint) {
    // Left pupil
    canvas.drawCircle(
      Offset(center.dx - 20, center.dy - 10),
      4,
      paint,
    );
  }
}

class RightPupil {
  void draw(Canvas canvas, Offset center, Paint paint) {
    // Right pupil
    canvas.drawCircle(
      Offset(center.dx + 20, center.dy - 10),
      4,
      paint,
    );
  }
}