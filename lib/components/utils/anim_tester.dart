import 'dart:async';

import 'package:dial_lock/provider/dot_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimTester extends StatefulWidget {
  final double radius = 50;
  @override
  _AnimTesterState createState() => _AnimTesterState();
}

class _AnimTesterState extends State<AnimTester> {
  /// dot inside color should animate, also scale from left2Right

  DotState _state = DotState.complete;
  List<int> _userInput = [2, 3, 9, 0];
  bool _valid = false;
  int _currentIndex = 0;

  get _textStyle => GoogleFonts.dokdo(
        color: Colors.black,
        fontSize: widget.radius * .75,
      );

  _fadeOut() {
    /// change assign userInput & change COlor
    setState(() => _currentIndex = 0);
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_currentIndex > 3) {
        timer.cancel();
        setState(() => _currentIndex = 0);
      } else {
        setState(() {
          _dotsState[_currentIndex] = DotState.idle;
          _currentIndex += 1;
        });
      }
    });
  }

  _validAnimation() async {
    setState(() => _currentIndex = 0);
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_currentIndex > 3) {
        timer.cancel();

        /// passCode visibility just before fadeOut
        Future.delayed(Duration(milliseconds: 500), () {
          _fadeOut();
        });
      } else {
        setState(() {
          _dotsState[_currentIndex] =
              _valid ? DotState.success : DotState.failed;
          _currentIndex += 1;
        });
      }
    });
  }

  _changeState() async {
    if (_currentIndex > 3) {
      /// validate
      _validAnimation();
      /// fadeOut
    } else {
      setState(() {
        _dotsState[_currentIndex] = DotState.complete;
        _currentIndex += 1;
      });
    }
  }

  _validate() {}

  List<DotState> _dotsState = [
    DotState.idle,
    DotState.idle,
    DotState.idle,
    DotState.idle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dot Test"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildDot(0),
              buildDot(1),
              buildDot(2),
              buildDot(3),
            ],
          ),

          ///`Control` button
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _changeState,
                icon: Icon(Icons.color_lens),
              ),
              IconButton(
                onPressed: _validate,
                icon: Icon(Icons.error),
              ),
              IconButton(
                onPressed: _changeState,
                icon: Icon(Icons.done_rounded),
              ),
            ],
          )
        ],
      )),
    );
  }

  Container buildDot(int index) {
    final _containerInnerColor;

    if (_dotsState[index] == DotState.success)
      _containerInnerColor = Colors.green;
    else if (_dotsState[index] == DotState.failed)
      _containerInnerColor = Colors.red;
    else
      _containerInnerColor = Colors.white;

    ///Change innerColor based on DotState

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.radius / 10,
        vertical: 20,
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
      child: AnimatedContainer(
        alignment: Alignment.center,
        curve: Curves.easeInOutQuad,
        duration: Duration(milliseconds: 401),
        width: _dotsState[index] != DotState.idle ? widget.radius : 0,
        height: _dotsState[index] != DotState.idle ? widget.radius : 0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _containerInnerColor,
        ),
        child: _dotsState[index] == DotState.complete
            ? SizedBox()
            : Text(
                _userInput[index].toString(),
                style: _textStyle,
              ),
      ),
    );
  }
}
