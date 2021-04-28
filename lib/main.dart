import 'package:flutter/material.dart';
import 'package:yes_no_app/screen_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      title: 'Button',
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Screen1(),
        ),
      ),
    );
  }
}
