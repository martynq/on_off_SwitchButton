import 'package:flutter/material.dart';

class AnimatedToggleButton extends StatefulWidget {
  final Color onColor;
  final Color offColor;
  final String onText;
  final String offText;
  final Color toggleColor;
  final void Function() onToggle;

  const AnimatedToggleButton({
    @required this.onColor,
    @required this.offColor,
    @required this.onText,
    @required this.offText,
    @required this.toggleColor,
    @required this.onToggle,
  })  : assert(onColor != null),
        assert(offColor != null),
        assert(onText != null),
        assert(offText != null),
        assert(toggleColor != null);

  //    assert(onToggle != null);

  factory AnimatedToggleButton.onOff({@required Function(bool) onToggled}) => const AnimatedToggleButton(
        onColor: Colors.green,
        offColor: Colors.orange,
        toggleColor: Colors.white,
        onText: 'YES',
        offText: 'NO',
      );

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  bool toggleValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 34.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: toggleValue ? widget.onColor : widget.offColor,
          ),
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 34.0,
                width: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                left: toggleValue ? 80.0 / 2 : 0.0,
                right: toggleValue ? 0.0 : 80.0 / 2,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 100),
                child: InkWell(
                  onTap: _toggleButton,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
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
                              onTap: widget.onToggle,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: widget.toggleColor),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: widget.onToggle,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: widget.toggleColor),
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
    );
  }

  void _toggleButton() => setState(() {
        toggleValue = !toggleValue;
      });
}
