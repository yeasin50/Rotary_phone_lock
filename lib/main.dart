import 'package:dial_lock/provider/dot_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withAlpha(70),
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DotProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
