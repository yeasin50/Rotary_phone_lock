import 'dart:async';

import 'package:dial_lock/provider/dot_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

///we can just use container or go for custom paint
///container border + fill color, and final => replace fill color with input
///well, what should we do about indication 🤔,
///we can just use `static list/map` for dotState or use state management => `provider`

class IndicatorDots extends StatefulWidget {
  /// `responsible for creating Dots and controlling State`

  final double radius;
  IndicatorDots({required this.radius});

  @override
  _IndicatorDotsState createState() => _IndicatorDotsState();
}

class _IndicatorDotsState extends State<IndicatorDots> {
  get _textStyle => GoogleFonts.dokdo(
        color: Colors.black,
        fontSize: widget.radius * .75,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDot(0),
        buildDot(1),
        buildDot(2),
        buildDot(3),
      ],
    );
  }

  Container buildDot(int index) {
    ///Change innerColor based on DotState

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.radius / 10,
      ),
      width: widget.radius,
      height: widget.radius,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: widget.radius * .1,
        ),
      ),
      alignment: Alignment.center,
      child: Consumer<DotProvider>(builder: (_, value, child) {
        //// maybe we can call `_changeState()` here
        return AnimatedContainer(
          alignment: Alignment.center,
          curve: Curves.easeInQuint,
          duration: Duration(milliseconds: 400),
          width: value.dotsState[index] != DotState.idle ? widget.radius : 0,
          height: value.dotsState[index] != DotState.idle ? widget.radius : 0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value.containerInnderColor(value.dotsState[index]),
          ),
          child: value.dotsState[index] == DotState.complete
              ? SizedBox()
              : Text(
                  value.userInput[index].toString(),
                  style: _textStyle,
                ),
        );
      }),
    );
  }
}
