import 'package:dial_lock/paints/fingure_wheel.dart';
import 'package:dial_lock/paints/spring_house.dart';
import 'package:dial_lock/components/header_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/indicator_dot.dart';
import 'wheel_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

///lets' make it for phone 1st

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _headerTextStyle = GoogleFonts.timmana(
      fontSize: Theme.of(context).textTheme.headline4!.fontSize,
      fontWeight: FontWeight.w800,
    );
    return Container(
      color: Colors.yellow.withOpacity(.5),
      child: LayoutBuilder(builder: (context, constraints) {
        double _containerWidth = constraints.maxWidth * .9;
        double _wheelSize = _containerWidth * .835;

        return Stack(
          children: [
            Positioned(
              left: _containerWidth * 0.1,
              top: _containerWidth * 0.2,
              child: Header(
                "Enter".toUpperCase(),
                _headerTextStyle,
              ),
            ),
            Positioned(
              left: _containerWidth * 0.1,
              top: _containerWidth * 0.27,
              child: Header(
                "Passcode".toUpperCase(),
                _headerTextStyle,
              ),
            ),
            Align(
              alignment: Alignment(.8, -.5),
              child: IndicatorDots(
                radius: constraints.maxWidth * .07,
              ),
            ),
            Align(
              alignment: Alignment(0, .1),
              child: Container(
                height: _containerWidth,
                width: _containerWidth,
                child: CustomPaint(
                  isComplex: true,
                  painter: SpringHousePaint(
                    dialerRadius: _containerWidth * .45,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment(0, .1),
                /// this container helps to align with `SpringHousePaint`
                child: Container(
                  height: _containerWidth,
                  width: _containerWidth,
                  child: Wheel(
                    size: _wheelSize,
                  ),
                ))
          ],
        );
      }),
    );
  }
}
