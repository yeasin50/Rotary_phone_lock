import 'package:dial_lock/paints/fingure_wheel.dart';
import 'package:dial_lock/paints/spring_house.dart';
import 'package:dial_lock/components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/indicator_dot.dart';
import 'paints/wheel_svg.dart';
import 'wheel_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _dotRadius = 25.0;
  final double _dialerRadius = 140;
  @override
  Widget build(BuildContext context) {
    final TextStyle _headerTextStyle = GoogleFonts.timmana(
      fontSize: Theme.of(context).textTheme.headline4!.fontSize,
      fontWeight: FontWeight.w800,
    );
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Positioned(
            left: 10,
            top: 100,
            child: Header(
              "Enter".toUpperCase(),
              _headerTextStyle,
            ),
          ),
          Positioned(
            left: 10,
            top: 130,
            child: Header(
              "Passcode".toUpperCase(),
              _headerTextStyle,
            ),
          ),
          Align(
            alignment: Alignment(.8, -.5),
            child: buildDots(),
          ),
          Align(
            alignment: Alignment(0, .3),
            child: Container(
              height: constraints.maxHeight * .5,
              width: constraints.maxHeight * .5,
              child: CustomPaint(
                isComplex: true,
                painter: SpringHousePaint(
                  dialerRadius: constraints.maxHeight * .2,
                ),
              ),
            ),
          ),
          WheelStateWidget(
            constraints: constraints,
          )
        ],
      ),
    );
  }

  Row buildDots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomContainer(
          radius: _dotRadius,
        ),
        CustomContainer(
          radius: _dotRadius,
        ),
        CustomContainer(
          radius: _dotRadius,
        ),
        CustomContainer(
          radius: _dotRadius,
        ),
      ],
    );
  }
}

