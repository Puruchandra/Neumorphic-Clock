import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DateTime now = DateTime.now();

    double radius = size.width / 2;
    final centerXY = Offset(radius, radius);
    // ? new code
    //! second
    Paint handPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    //? centerX - r * angle
    //? centerY - r * angle
    double x = radius - 100 * math.cos((360 / 60 * now.second) * math.pi / 180);
    double y = radius - 100 * math.sin((360 / 60 * now.second) * math.pi / 180);
    final secondP2 = Offset(x, y);
    handPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    //! minute
    Paint minutePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    x = radius - 80 * math.cos((360 / 60 * now.minute) * math.pi / 180);
    y = radius - 80 * math.sin((360 / 60 * now.minute) * math.pi / 180);
    final minuteP2 = Offset(x, y);

    //!hour
    Paint hourPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    x = radius - 60 * math.cos((360 / 12 * (now.hour - 12)) * math.pi / 180);
    y = radius - 60 * math.sin((360 / 12 * (now.hour - 12)) * math.pi / 180);
    final hourP2 = Offset(x, y);

    canvas.drawLine(centerXY, secondP2, handPaint);
    canvas.drawLine(centerXY, minuteP2, minutePaint);
    canvas.drawLine(centerXY, hourP2, hourPaint);
    canvas.drawCircle(centerXY, 7, Paint()..color = Colors.white);

    //! dashes print
    for (var i = 1; i <= 12; i++) {
      Paint dashPaint = Paint()
        ..color = Colors.grey[300]
        ..strokeWidth = 3;
      double heightP1 = 130;

      double x =
          radius + 120 * math.cos((360 / 12 * (now.hour - i)) * math.pi / 180);
      double y =
          radius + 120 * math.sin((360 / 12 * (now.hour - i)) * math.pi / 180);
      Offset p1 = Offset(x, y);
      double x2 = radius +
          heightP1 * math.cos((360 / 12 * (now.hour - i)) * math.pi / 180);
      double y2 = radius +
          heightP1 * math.sin((360 / 12 * (now.hour - i)) * math.pi / 180);
      Offset p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, dashPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
