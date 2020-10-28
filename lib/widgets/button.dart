import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onTap;
  final double diameter;
  final String name;

  const Button({
    Key key,
    @required this.name,
    @required this.diameter,
    @required this.onTap,
  }) : super(key: key);

  void onTapButton() {
    print('${name}');
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: diameter,
      width: diameter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x88ffffff),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          onTap: onTapButton,
        ),
      ),
    );
  }
}