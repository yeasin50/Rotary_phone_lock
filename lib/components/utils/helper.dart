import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaintHelper {
  static getTextPainter(int digit) {
    final TextStyle _textStyle = GoogleFonts.roboto(
      fontSize: 27,
      color: Colors.white,
      fontWeight: FontWeight.w800,
    );
    final textSpan = TextSpan(
      text: '$digit',
      style: _textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 900, // little cheat
    );

    return textPainter;
  }
}
