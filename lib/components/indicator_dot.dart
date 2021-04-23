import 'package:flutter/material.dart';

///we can just use container or go for custom paint
///container border + fill color, and final => replace fill color with input

class CustomContainer extends StatelessWidget {
  final double radius;
  CustomContainer({required this.radius});

  final _decoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.black,
        width: 2,
      ));
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: radius / 10),
      width: radius,
      height: radius,
      decoration: _decoration,
      alignment: Alignment.center,
      child: Text("A"),
    );
  }
}
