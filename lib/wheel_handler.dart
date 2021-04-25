import 'dart:async';

import 'package:flutter/material.dart';

class WheelStateWidget extends StatefulWidget {
  final size;

  const WheelStateWidget({Key? key, this.size}) : super(key: key);

  @override
  _WheelStateWidgetState createState() => _WheelStateWidgetState();
}

class _WheelStateWidgetState extends State<WheelStateWidget> {
  double _angel = 0;
  double _containerHeight = 300;

  int _clickedDigit = -1;

  /// instead of decreasing movement, its' better to use `_timer Duration`, and lets' use microSec
  /// decreasing movement lead Ui trouble.
  double _playBackMovement = 0.015;
  //// Duration on miliSec
  int _basePlayBackRate = 600;
  int _playBackRate = 800;
  get playBackRate => _playBackRate;
  setPlayBackRate(int _rate) => setState(() => _playBackRate = _rate);

  ///get back to the orginal possition while ange!=0
  _coolDown() {
    Timer.periodic(Duration(microseconds: playBackRate), (timer) {
      //refresh frame while cool down
      setState(() {
        if (_angel >= 0) {
          _angel -= _playBackMovement;
        } else {
          timer.cancel();
          // print("Timer End, angel: $_angel");
        }
      });
    });
  }

  ///`EOF coolDown`

  _calDown(Offset offset) {
    /// we can also use offset, but it doesnt need any longer being _angel calculation
    // if (offset.dy > _prevOffset.dy) {
    if (_clickedDigit == 1 && _angel < 1.071) {
      setState(() {
        _angel += .017;
        setPlayBackRate(_basePlayBackRate);
      });
    } else if (_clickedDigit == 2 && _angel < 1.57) {
      setState(() {
        _angel += .017;
        setPlayBackRate((_basePlayBackRate * .9).ceil());
      });
    } else if (_clickedDigit == 3 && _angel < 2.06) {
      setState(() {
        _angel += .0174;
        setPlayBackRate((_basePlayBackRate * .8).ceil());
      });
    } else if (_clickedDigit == 4 && _angel < 2.57) {
      setState(() {
        _angel += .0177;
        setPlayBackRate((_basePlayBackRate * .6).ceil());
      });
    } else if (_clickedDigit == 5 && _angel < 3.093) {
      setState(() {
        _angel += .018;
        setPlayBackRate((_basePlayBackRate * .5).ceil());
      });
    } else if (_clickedDigit == 6 && _angel < 3.595) {
      setState(() {
        _angel += .019;
        setPlayBackRate((_basePlayBackRate * .35).ceil());
      });
    } else if (_clickedDigit == 7 && _angel < 4.1650) {
      setState(() {
        _angel += .019;
        setPlayBackRate((_basePlayBackRate * .26).ceil());
      });
    } else if (_clickedDigit == 8 && _angel < 4.612) {
      setState(() {
        _angel += .019;
        setPlayBackRate((_basePlayBackRate * .2).ceil());
      });
    } else if (_clickedDigit == 9 && _angel < 5.15) {
      setState(() {
        _angel += .02;
        setPlayBackRate((_basePlayBackRate * .061).ceil());
      });
    } else if (_clickedDigit == 0 && _angel < 5.725) {
      setState(() {
        _angel += .0205;
        setPlayBackRate((20).ceil());
      });
    }
    // print("angel: $_angel  OffsetDY: ${offset.dy}");
    // }
  }

  _rotateHandler(DragUpdateDetails details) {
    Offset offset = details.localPosition;

    switch (_clickedDigit) {
      case 1:
        _calDown(offset);
        break;
      case 2:
        _calDown(offset);
        break;
      case 3:
        _calDown(offset);
        break;
      case 4:
        _calDown(offset);
        break;
      case 5:
        _calDown(offset);
        break;
      case 6:
        _calDown(offset);
        break;
      case 7:
        _calDown(offset);
        break;
      case 8:
        _calDown(offset);
        break;
      case 9:
        _calDown(offset);
        break;
      case 0:
        _calDown(offset);
        break;
    }
  }

  ///TODO:: need some adgusment for new Image
  _buttonCheker(DragDownDetails details) {
    ///we have find out which button is pressed, then we can controler the rotation
    ///we can also use stack , define some invisible button to check it
    Offset _localOffset = details.localPosition;
    // print("$_localOffset  containerSize: $_containerHeight");

    ///`1`
    if (_localOffset.dx > _containerHeight * .82 &&
        _localOffset.dy > _containerHeight * .2 &&
        _localOffset.dy < _containerHeight * .32) {
      // print("on 1");
      setState(() => _clickedDigit = 1);
    }

    ///`2`
    else if (_localOffset.dx < _containerHeight * .82 &&
        _localOffset.dx > _containerHeight * .67 &&
        _localOffset.dy < _containerHeight * .2 &&
        _localOffset.dy > _containerHeight * .05) {
      // print("on 2");
      setState(() => _clickedDigit = 2);
    }

    ///`0`
    else if (_localOffset.dx > _containerHeight * .682 &&
        _localOffset.dx < _containerHeight * .8 &&
        _localOffset.dy > _containerHeight * .8 &&
        _localOffset.dy < _containerHeight * .92) {
      // print("on 0");
      setState(() => _clickedDigit = 0);
    }

    ///`4`
    else if (_localOffset.dx < _containerHeight * .37 &&
        _localOffset.dx > _containerHeight * .26 &&
        _localOffset.dy < _containerHeight * .2 &&
        _localOffset.dy > _containerHeight * .05) {
      // print("on 4");
      setState(() => _clickedDigit = 4);
    }

    ///`8`
    else if (_localOffset.dx < _containerHeight * .37 &&
        _localOffset.dx > _containerHeight * .257 &&
        _localOffset.dy < _containerHeight * .9 &&
        _localOffset.dy > _containerHeight * .79) {
      // print("on 8");
      setState(() => _clickedDigit = 8);
    }

    ///`9`
    else if (_localOffset.dx < _containerHeight * .578 &&
        _localOffset.dx > _containerHeight * .47 &&
        _localOffset.dy > _containerHeight * .85) {
      // print("on 9");
      setState(() => _clickedDigit = 9);
    }

    ///`3`
    else if (_localOffset.dx < _containerHeight * .578 &&
        _localOffset.dx > _containerHeight * .47 &&
        _localOffset.dy < _containerHeight * .12) {
      // print("on 3");
      setState(() => _clickedDigit = 3);
    }

    ///`6`
    else if (_localOffset.dx < _containerHeight * .19 &&
        _localOffset.dx > _containerHeight * .05 &&
        _localOffset.dy > _containerHeight * .43 &&
        _localOffset.dy < _containerHeight * .56) {
      // print("on 6");
      setState(() => _clickedDigit = 6);
    }

    ///`7`
    else if (_localOffset.dx < _containerHeight * .2 &&
        _localOffset.dx > _containerHeight * .1 &&
        _localOffset.dy > _containerHeight * .64 &&
        _localOffset.dy < _containerHeight * .75) {
      // print("on 7");
      setState(() => _clickedDigit = 7);
    }

    ///`5`
    else if (_localOffset.dx < _containerHeight * .22 &&
        _localOffset.dx > _containerHeight * .1 &&
        _localOffset.dy > _containerHeight * .2 &&
        _localOffset.dy < _containerHeight * .32) {
      // print("on 5");
      setState(() => _clickedDigit = 5);
    }

    print(_clickedDigit);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanEnd: (details) {
          setState(() => _clickedDigit = -1);
          // print("onPanEnd $_clickedDigit");
          _coolDown();
        },
        onPanDown: (details) => _buttonCheker(details),
        onPanUpdate: (details) => _rotateHandler(details),
        child: Container(
          // color: Colors.yellow,
          height: widget.size,
          // height: _containerHeight,
          width: _containerHeight,
          child:
              // Stack(
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

          //   // /fingure
          //   Positioned(
          //     right: _containerHeight * .05,
          //     bottom: _containerHeight * .21,
          //     child: Container(
          //       width: _containerHeight * .13,
          //       height: _containerHeight * .13,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.green.withOpacity(.5),
          //       ),
          //     ),
          //   )
          // ],
          // ),
        ),
      ),
    );
  }
}
