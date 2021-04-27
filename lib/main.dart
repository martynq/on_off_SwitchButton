import 'package:flutter/material.dart';
import 'package:yes_no_app/animated_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const AnimatedToggleButton(
        onColor: Colors.blue,
        offColor: Colors.red,
        toggleColor: Colors.white,
        onText: 'YES',
        offText: 'NO',
        boxBorderRadius: 5.0,
        toggleBorderRadius: 5.0,
        animatedContainerWidth: 80.0,
        animatedContainerHeight: 34.0,
        toggleSize: 25.0,
        animationMillisecondDuration: 100,
      ),
    );
  }
}

