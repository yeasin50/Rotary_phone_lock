import 'package:flutter/material.dart';

class WheelStateWidget extends StatelessWidget {
  final constraints;

  const WheelStateWidget({Key? key, this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.1, .3),
      child: Container(
        height: constraints.maxHeight * .5,
        child: AspectRatio(
          aspectRatio: .73,
          child: Image.asset(
            "images/wheel.png",
          ),
        ),
      ),
    );
  }
}
