import 'package:flutter/material.dart';
import 'package:yes_no_app/animated_button.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedToggleButton.onOff(
          onToggled: (value) {},
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        AnimatedToggleButton.yesNo(
          onToggled: (value) {},
        ),
      ],
    );
  }
}
