import 'dart:math';
import 'package:flutter/material.dart';

class Joypad extends StatefulWidget {
  final void Function(Offset) onChange;

  const Joypad({
    Key key,
    @required this.onChange,
  }) : super(key: key);

  JoypadState createState() => JoypadState();
}

class JoypadState extends State<Joypad> {
  Offset delta = Offset.zero;

  static const double outerSize = 120;
  static const double innerSize = outerSize / 2;

  double outerCircleDiameter = outerSize;
  double outerCircleRadius = outerSize / 2;
  Color outerCircleColor = Color(0x88ffffff);

  double innerCircleDiameter = innerSize;
  double innerCircleRadius = innerSize / 2;
  Color innerCircleColor = Color(0xccffffff);

  void updateDelta(Offset newDelta) {
    widget.onChange(newDelta);
    setState(() {
      delta = newDelta;
    });
  }

  void calculateDelta(Offset offset) {
    double maxMovement = (outerCircleRadius - innerCircleRadius);

    // offset is originated from localPosition
    Offset newDelta = offset - Offset(outerCircleRadius, outerCircleRadius);
    print('offset=$offset, newDelta=$newDelta,(distance=${newDelta.distance}, direction=${newDelta.direction})');

    updateDelta(
      Offset.fromDirection(
        newDelta.direction,
        min(maxMovement, newDelta.distance),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: outerCircleDiameter,
      width: outerCircleDiameter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(outerCircleRadius),
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: outerCircleColor,
              borderRadius: BorderRadius.circular(outerCircleRadius),
            ),
            child: Center(
              child: Transform.translate(
                offset: delta,
                child: SizedBox(
                  height: innerCircleDiameter,
                  width: innerCircleDiameter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: innerCircleColor,
                      borderRadius: BorderRadius.circular(innerCircleRadius),
                    ),
                  ),
                ),
              ),
            ),
          ),
          onPanDown: onDragDown,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
        ),
      ),
    );
  }

  void onDragDown(DragDownDetails d) {
    print('onDragDown: ${d.globalPosition}, ${d.localPosition}');
    calculateDelta(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    print('onDragUpdate: ${d.globalPosition}, ${d.localPosition}, ${d.delta}');
    calculateDelta(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }
}