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
        theme: ThemeData(), home: AnimatedToggleButton.greenOrange());
  }
}
