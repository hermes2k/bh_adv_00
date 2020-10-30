import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const String DEFAULT_PATH_TO_BUTTON = 'assets/images/icons/attack.png';

  final void Function() onTapCallback;
  final double diameter;
  final String name;
  double radius;
  Color color;
  String pathToImage;

  Button({
    Key key,
    @required this.name,
    @required this.diameter,
    @required this.onTapCallback,
    String pathToImage
  }) : super(key: key) {
    this.radius = diameter / 2;
    this.color = Color(0x88ffffff);
    if (pathToImage != null) {
      this.pathToImage = pathToImage;
    } else {
      this.pathToImage = DEFAULT_PATH_TO_BUTTON;
    }
  }

  void onTapButton() {
    print('$name');
    onTapCallback();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: diameter,
      width: diameter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              border: new Border.all(
                color: Colors.grey,
                width: 1.0,
                style: BorderStyle.solid
              ),
              color: color,
              borderRadius: BorderRadius.circular(radius),
              image: new DecorationImage(
                image: new AssetImage(pathToImage),
                fit: BoxFit.contain,
              ),
              /*
              boxShadow: [
                new BoxShadow(
                  color: Colors.white,
                  offset: new Offset(10.0, 5.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ),
              ],
              */
            ),
          ),
          onTap: onTapButton,
        ),
      ),
    );
  }
}