import 'dart:async';

import 'package:dial_lock/provider/dot_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/indicator_dot.dart';

class Wheel extends StatefulWidget {
  final size;

  const Wheel({Key? key, this.size}) : super(key: key);

  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  double _angel = 0;
  int _clickedDigit = -1;

  /// increase after confirming Digit
  int _numOfConfrim = 0;

  // ignore: slash_for_doc_comments
  /*** `story` 
  * instead of decreasing movement, its' better to use `_timer Duration`, and lets' use microSec.
  * you may thinking `flutter provides 60 fps` then why using micro>>
  * because if in backend we are calculating , if we increase movement instead of decreasing time,
  * our wheel position can be mis-placed during large portion of movement
  * `decreasing movement lead Ui trouble`.
  ***/

  /// this will decrease angel on CoolDown process =>`Back To Original Position`
  ///  `currentAngel -=_playBackMovement `
  double _playBackMovement = 0.015;

  /// [Duration] on miliSec
  int _basePlayBackRate = 600;
  int _playBackRate = 800;
  get playBackRate => _playBackRate;
  setPlayBackRate(int _rate) => setState(() => _playBackRate = _rate);

  bool _confirmDigit = false;

  _coolDown() {
    ///get back to the orginal possition while ange!=0
    ///lets' handle here of `confirming Digit`
    final provider = Provider.of<DotProvider>(context, listen: false);

    Timer.periodic(Duration(microseconds: playBackRate), (timer) {
      //refresh frame while cool down
      setState(() {
        if (_angel >= 0) {
          _angel -= _playBackMovement;
        } else {
          timer.cancel();
          print(
              "Timer End, _numOfConfrim: $_numOfConfrim _confirmDigit: $_confirmDigit");
          setState(() {
            /// `Digit Confirm and Update user Dot` dot effects
            if (_confirmDigit) {
              provider.updateUserInput(_numOfConfrim, _clickedDigit);
              _numOfConfrim += 1;
            }
            if (_numOfConfrim >= provider.numberOfDot) {
              _numOfConfrim = 0;
            }
            _confirmDigit = false;
            _clickedDigit = -1;
          });
          // print(
          //     "Timer End,_numOfConfrim:$_numOfConfrim  _confirmDigit: $_confirmDigit");
        }
      });
    });
  }

  //`EOF coolDown`
  _calDown(Offset offset) {
    /// move wheel on [GestureDetector]
    /// we can improve this By creating 4 calculation, for [DragDownDetails]
    /// i've already separated for Each digit. but For `0, 9, 8` we have calculate 4sides.
    /// we can do it by checking [Transform] angle possition.
    /// we can also use offset, but it doesnt need any longer being `_angel` calculation.
    ///
    /// `Confirmat digit on FigureStop`
    /// we can compare our current `_angel` according to Digit
    /// a little bit `-`from max _angel limit or `=`  will confirm the digit
    ///********* */

    //// indicate if the digit is confirmed or not
    ///using `DotProvider` here gives more User xp

    // if (offset.dy > _prevOffset.dy) {
    /// comes From UI == compare Digit && currentAngel < MaxAngel
    if (_clickedDigit == 1 && _angel < 1.071) {
      setState(() {
        _angel += .017;
        if (_angel > 1.07) _confirmDigit = true;
        setPlayBackRate(_basePlayBackRate);
      });
    } else if (_clickedDigit == 2 && _angel < 1.57) {
      setState(() {
        _angel += .017;
        if (_angel > 1.53) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .9).ceil());
      });
    } else if (_clickedDigit == 3 && _angel < 2.06) {
      setState(() {
        _angel += .0174;
        if (_angel > 2.02) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .8).ceil());
      });
    } else if (_clickedDigit == 4 && _angel < 2.57) {
      setState(() {
        _angel += .0177;
        if (_angel > 2.5) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .6).ceil());
      });
    } else if (_clickedDigit == 5 && _angel < 3.093) {
      setState(() {
        _angel += .018;
        if (_angel > 2.9) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .5).ceil());
      });
    } else if (_clickedDigit == 6 && _angel < 3.595) {
      setState(() {
        _angel += .019;
        if (_angel > 3.3) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .35).ceil());
      });
    } else if (_clickedDigit == 7 && _angel < 4.1650) {
      setState(() {
        _angel += .019;
        if (_angel > 4.1) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .26).ceil());
      });
    } else if (_clickedDigit == 8 && _angel < 4.612) {
      setState(() {
        _angel += .019;
        if (_angel > 4.5) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .2).ceil());
      });
    } else if (_clickedDigit == 9 && _angel < 5.15) {
      setState(() {
        _angel += .02;
        if (_angel > 5) _confirmDigit = true;
        setPlayBackRate((_basePlayBackRate * .061).ceil());
      });
    } else if (_clickedDigit == 0 && _angel < 5.725) {
      setState(() {
        _angel += .0205;
        if (_angel > 5.5) _confirmDigit = true;
        setPlayBackRate((20).ceil());
      });
    }
    // print("angel: $_angel  OffsetDY: ${offset.dy}");
    // }
    //
    /// update dotsStatus
    final provider = Provider.of<DotProvider>(context, listen: false);
    if (_confirmDigit)
      provider.updateDotState(_numOfConfrim, DotState.complete);
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
    // print("$_localOffset  containerSize: $_widget.size");

    ///`1`
    if (_localOffset.dx > widget.size * .82 &&
        _localOffset.dy > widget.size * .2 &&
        _localOffset.dy < widget.size * .32) {
      // print("on 1");
      setState(() => _clickedDigit = 1);
    }

    ///`2`
    else if (_localOffset.dx < widget.size * .82 &&
        _localOffset.dx > widget.size * .67 &&
        _localOffset.dy < widget.size * .2 &&
        _localOffset.dy > widget.size * .05) {
      // print("on 2");
      setState(() => _clickedDigit = 2);
    }

    ///`0`
    else if (_localOffset.dx > widget.size * .682 &&
        _localOffset.dx < widget.size * .8 &&
        _localOffset.dy > widget.size * .8 &&
        _localOffset.dy < widget.size * .92) {
      // print("on 0");
      setState(() => _clickedDigit = 0);
    }

    ///`4`
    else if (_localOffset.dx < widget.size * .37 &&
        _localOffset.dx > widget.size * .26 &&
        _localOffset.dy < widget.size * .2 &&
        _localOffset.dy > widget.size * .05) {
      // print("on 4");
      setState(() => _clickedDigit = 4);
    }

    ///`8`
    else if (_localOffset.dx < widget.size * .37 &&
        _localOffset.dx > widget.size * .257 &&
        _localOffset.dy < widget.size * .9 &&
        _localOffset.dy > widget.size * .79) {
      // print("on 8");
      setState(() => _clickedDigit = 8);
    }

    ///`9`
    else if (_localOffset.dx < widget.size * .578 &&
        _localOffset.dx > widget.size * .47 &&
        _localOffset.dy > widget.size * .85) {
      // print("on 9");
      setState(() => _clickedDigit = 9);
    }

    ///`3`
    else if (_localOffset.dx < widget.size * .578 &&
        _localOffset.dx > widget.size * .47 &&
        _localOffset.dy < widget.size * .12) {
      // print("on 3");
      setState(() => _clickedDigit = 3);
    }

    ///`6`
    else if (_localOffset.dx < widget.size * .19 &&
        _localOffset.dx > widget.size * .05 &&
        _localOffset.dy > widget.size * .43 &&
        _localOffset.dy < widget.size * .56) {
      // print("on 6");
      setState(() => _clickedDigit = 6);
    }

    ///`7`
    else if (_localOffset.dx < widget.size * .2 &&
        _localOffset.dx > widget.size * .1 &&
        _localOffset.dy > widget.size * .64 &&
        _localOffset.dy < widget.size * .75) {
      // print("on 7");
      setState(() => _clickedDigit = 7);
    }

    ///`5`
    else if (_localOffset.dx < widget.size * .22 &&
        _localOffset.dx > widget.size * .1 &&
        _localOffset.dy > widget.size * .2 &&
        _localOffset.dy < widget.size * .32) {
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
          // print("onPanEnd $_clickedDigit");
          _coolDown();
        },
        onPanDown: (details) => _buttonCheker(details),
        onPanUpdate: (details) => _rotateHandler(details),
        child: Container(
          // color: Colors.yellow,
          height: widget.size,
          // height: _widget.size,
          width: widget.size,
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
          //       right: _widget.size * .2,
          //       top: _widget.size * .0600,
          //       child: Container(
          //         width: _widget.size * .13,
          //         height: _widget.size * .13,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green.withOpacity(.5),
          //         ),
          //       ),
          //     ),

          //     ///2
          //     Positioned(
          //       right: _widget.size * .2,
          //       bottom: _widget.size * .0600,
          //       child: Container(
          //         width: _widget.size * .13,
          //         height: _widget.size * .13,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green.withOpacity(.5),
          //         ),
          //       ),
          //     ),

          //   // /fingure
          //   Positioned(
          //     right: _widget.size * .05,
          //     bottom: _widget.size * .21,
          //     child: Container(
          //       width: _widget.size * .13,
          //       height: _widget.size * .13,
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
