import 'package:flutter/material.dart';

import 'components/utils/anim_tester.dart';
import 'body.dart';
import 'wheel_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: WheelStateWidget(),
        ),
      ),
    );
  }
}
