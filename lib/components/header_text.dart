import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final TextStyle _style;
  final String _text;
  Header(
    this._text,
    this._style,
  );
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: _style,
    );
  }
}
