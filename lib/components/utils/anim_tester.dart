import 'package:flutter/material.dart';

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
        _angel += .1;
      });
    } else {
      setState(() {
        _angel -= .1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onPanUpdate: (details) {
          _rotate(details.localPosition);
        },
        child: Transform.rotate(
          angle: _angel,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Text(
              "A",
              style: TextStyle(
                fontSize: 44,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
