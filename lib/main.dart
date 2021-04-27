import 'package:flutter/material.dart';

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

class AnimatedToggleButton extends StatefulWidget {
  final Color onColor;
  final Color offColor;
  final String onText;
  final String offText;
  final Color toggleColor;
  final double boxBorderRadius;
  final double toggleBorderRadius;
  final double animatedContainerWidth;
  final double animatedContainerHeight;
  final double toggleSize;
  final int animationMillisecondDuration;
  final void Function() onONFunction;
  final void Function() onOffFunction;

  const AnimatedToggleButton({
    Key key,
    this.onColor,
    this.offColor,
    this.onText,
    this.offText,
    this.toggleColor,
    this.boxBorderRadius,
    this.toggleBorderRadius,
    this.animatedContainerWidth,
    this.animatedContainerHeight,
    this.toggleSize,
    this.animationMillisecondDuration,
    this.onONFunction,
    this.onOffFunction,
  }) : super(key: key);

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration:
                  Duration(milliseconds: widget.animationMillisecondDuration),
              height: widget.animatedContainerHeight,
              width: widget.animatedContainerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.boxBorderRadius),
                color: toggleValue ? widget.onColor : widget.offColor,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: widget.animatedContainerHeight,
                    width: widget.animatedContainerWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.onText,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: toggleValue
                                  ? widget.toggleColor
                                  : widget.offColor),
                        ),
                        Text(
                          widget.offText,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: toggleValue
                                  ? widget.onColor
                                  : widget.toggleColor),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    top: 1.0,
                    left: toggleValue ? widget.animatedContainerWidth / 2 : 0.0,
                    right:
                        toggleValue ? 0.0 : widget.animatedContainerWidth / 2,
                    curve: Curves.easeIn,
                    duration: Duration(
                        milliseconds: widget.animationMillisecondDuration),
                    child: InkWell(
                      onTap: toggleButton,
                      child: AnimatedSwitcher(
                        duration: Duration(
                            milliseconds: widget.animationMillisecondDuration),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return RotationTransition(
                            turns: animation,
                            child: child,
                          );
                        },
                        child: toggleValue
                            ? Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: widget.onONFunction,
                                  child: Container(
                                    width: widget.toggleSize,
                                    height: widget.toggleSize,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            widget.toggleBorderRadius),
                                        color: widget.toggleColor),
                                    key: UniqueKey(),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: widget.onOffFunction,
                                  child: Container(
                                    width: widget.toggleSize,
                                    height: widget.toggleSize,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            widget.toggleBorderRadius),
                                        color: widget.toggleColor),
                                    key: UniqueKey(),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ignore: always_declare_return_types, type_annotate_public_apis
  void toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
