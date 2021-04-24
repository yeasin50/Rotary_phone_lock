import 'dart:math' as math;

import 'package:flutter/material.dart';

class WheelStateWidget extends StatefulWidget {
  final constraints;

  const WheelStateWidget({Key? key, this.constraints}) : super(key: key);

  @override
  _WheelStateWidgetState createState() => _WheelStateWidgetState();
}

class _WheelStateWidgetState extends State<WheelStateWidget> {
  double _angel = 0;
  double _containerHeight = 300;

  int _pressed = -1;

  Offset _prevOffset = Offset.zero;

  _rotateHandler(DragUpdateDetails details) {
    Offset offset = details.localPosition;

    // print("$offset  $_angel");
    if (offset.dx > _prevOffset.dx || offset.dy > _prevOffset.dy) {
      setState(() {
        _angel += .02;
        _prevOffset = offset;
      });
    } else {
      setState(() {
        _angel -= .02;
        _prevOffset = offset;
      });
    }
  }

  _buttonCheker(DragDownDetails details) {
    ///we have find out which button is pressed, then we can controler the rotation
    ///we can also use stack , define some invisible button to check it
    Offset _localOffset = details.localPosition;
    print("$_localOffset  containerSize: $_containerHeight");

    ///`1`
    if (_localOffset.dx > _containerHeight * .82 &&
        _localOffset.dy > _containerHeight * .2 &&
        _localOffset.dy < _containerHeight * .32) {
      print("on 1");
    }

    ///`2`
    else if (_localOffset.dx < _containerHeight * .82 &&
        _localOffset.dx > _containerHeight * .67 &&
        _localOffset.dy < _containerHeight * .2 &&
        _localOffset.dy > _containerHeight * .05) {
      print("on 2");
    }

    ///`0`
    else if (_localOffset.dx > _containerHeight * .682 &&
        _localOffset.dx < _containerHeight * .8 &&
        _localOffset.dy > _containerHeight * .8 &&
        _localOffset.dy < _containerHeight * .92) {
      print("on 0");
    }

    ///`4`
    else if (_localOffset.dx < _containerHeight * .37 &&
        _localOffset.dx > _containerHeight * .26 &&
        _localOffset.dy < _containerHeight * .2 &&
        _localOffset.dy > _containerHeight * .05) {
      print("on 4");
    }

    ///`8`
    else if (_localOffset.dx < _containerHeight * .37 &&
        _localOffset.dx > _containerHeight * .257 &&
        _localOffset.dy < _containerHeight * .9 &&
        _localOffset.dy > _containerHeight * .79) {
      print("on 8");
    }

    ///`9`
    else if (_localOffset.dx < _containerHeight * .578 &&
        _localOffset.dx > _containerHeight * .47 &&
        _localOffset.dy > _containerHeight * .85) {
      print("on 9");
    }

    ///`3`
    else if (_localOffset.dx < _containerHeight * .578 &&
        _localOffset.dx > _containerHeight * .47 &&
        _localOffset.dy < _containerHeight * .12) {
      print("on 3");
    }

    ///`6`
    else if (_localOffset.dx < _containerHeight * .19 &&
        _localOffset.dx > _containerHeight * .05 &&
        _localOffset.dy > _containerHeight * .43 &&
        _localOffset.dy < _containerHeight * .56) {
      print("on 6");
    }

    ///`7`
    else if (_localOffset.dx < _containerHeight * .2 &&
        _localOffset.dx > _containerHeight * .1 &&
        _localOffset.dy > _containerHeight * .64 &&
        _localOffset.dy < _containerHeight * .75) {
      print("on 7");
    }

    ///`5`
    else if (_localOffset.dx < _containerHeight * .22 &&
        _localOffset.dx > _containerHeight * .1 &&
        _localOffset.dy > _containerHeight * .2 &&
        _localOffset.dy < _containerHeight * .32) {
      print("on 5");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanDown: (details) => _buttonCheker(details),
        // onPanUpdate: (details) => _rotateHandler(details),
        child: Container(
          color: Colors.yellow,
          // height: constraints.maxHeight * .5,
          height: _containerHeight,
          width: _containerHeight,
          child:
              //  Stack(
              //   children: [
              Transform.rotate(
            angle: _angel,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                "images/wheel.png",
              ),
            ),
          ),

          //     ///2
          //     Positioned(
          //       right: _containerHeight * .2,
          //       top: _containerHeight * .0600,
          //       child: Container(
          //         width: _containerHeight * .13,
          //         height: _containerHeight * .13,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green.withOpacity(.5),
          //         ),
          //       ),
          //     ),

          //     ///2
          //     Positioned(
          //       right: _containerHeight * .2,
          //       bottom: _containerHeight * .0600,
          //       child: Container(
          //         width: _containerHeight * .13,
          //         height: _containerHeight * .13,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green.withOpacity(.5),
          //         ),
          //       ),
          //     ),

          //     ///2
          //     Positioned(
          //       right: _containerHeight * .2,
          //       top: _containerHeight * .0600,
          //       child: Container(
          //         width: _containerHeight * .13,
          //         height: _containerHeight * .13,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green.withOpacity(.5),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
