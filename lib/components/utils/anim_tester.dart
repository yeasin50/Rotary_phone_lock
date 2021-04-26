import 'package:flutter/material.dart';

import '../../wheel_handler.dart';

class AnimTester extends StatefulWidget {
  @override
  _AnimTesterState createState() => _AnimTesterState();
}

class _AnimTesterState extends State<AnimTester> {
  double _angel = 0;
  Offset _prevOffset = Offset.zero;
  _rotate(Offset offset) {
    print("$offset  $_angel");
    if (0 < offset.dx) {
      setState(() {
        _angel += .01;
      });
    } else {
      setState(() {
        _angel -= .01;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            _rotate(details.localPosition);
          },
          child: Transform.rotate(
              angle: _angel,
              child: Wheel(
                size: 200,
              )),
        ),
      ),
    );
  }
}
