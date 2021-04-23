import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// well i can use alpha images , then pan down and up count , too easy ha
class FingureWheelPaint extends CustomPainter {
  final double dialerRadius;

  FingureWheelPaint({required this.dialerRadius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green.withOpacity(.5)
      ..strokeWidth = dialerRadius * .3
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    /// center++ for dialer
    Offset _center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(_center, dialerRadius * .82, paint);
    paint..color = Colors.red;

    ///`dialer digits`
    ///`3`
    Offset offset = Offset(size.width * .47, size.height * .120);
    canvas.drawCircle(offset, 20, paint);

    // ///`2`
    // offset = Offset(size.width * .63, size.height * .16);
    // PaintHelper.getTextPainter(2).paint(canvas, offset);

    // ///`1`
    // offset = Offset(size.width * .75, size.height * .27);
    // PaintHelper.getTextPainter(1).paint(canvas, offset);

    // ///`9`
    // offset = Offset(size.width * .47, size.height * .775);
    // PaintHelper.getTextPainter(9).paint(canvas, offset);

    // ///`8`
    // offset = Offset(size.width * .3, size.height * .72);
    // PaintHelper.getTextPainter(8).paint(canvas, offset);

    // ///`7`
    // offset = Offset(size.width * .184, size.height * .62);
    // PaintHelper.getTextPainter(7).paint(canvas, offset);

    // ///`6`
    // offset = Offset(size.width * .15, size.height * .45);
    // PaintHelper.getTextPainter(6).paint(canvas, offset);

    // ///`5`
    // offset = Offset(size.width * .19, size.height * .275);
    // PaintHelper.getTextPainter(5).paint(canvas, offset);

    // ///`4`
    // offset = Offset(size.width * .32, size.height * .15);
    // PaintHelper.getTextPainter(4).paint(canvas, offset);

    // /// `0`
    // offset = Offset(size.width * .62, size.height * .733);
    // PaintHelper.getTextPainter(0).paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
