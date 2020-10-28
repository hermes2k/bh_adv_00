import 'dart:ui';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:bh_adv_00/adv-game.dart';
import 'package:bh_adv_00/helpers/directions.dart';

class Hero {
  final AdvGame game;
  Offset position = Offset.zero;
  Direction direction = Direction.up;

  Hero(this.game, {this.position});

  void render(Canvas canvas) {
    double width = 30;
    double height = 30;
    Rect heroRect = Rect.fromLTWH(0, 0, width, height);
    Paint heroPaint = Paint()..color = Color(0xff372f32);

    //print('Hero : topLeft=${heroRect.topLeft}, bottomRight=${heroRect.bottomRight}');

    canvas.save();
    canvas.translate(position.dx, position.dy);

    canvas.drawRect(heroRect, heroPaint);

    canvas.restore();

    switch (direction) {
      case Direction.up:
        canvas.rotate(0);
        break;
      case Direction.right:
        canvas.rotate(pi / 2);
        break;
      case Direction.down:
        canvas.rotate(pi);
        break;
      case Direction.left:
        canvas.rotate(pi);
        break;
    }

  }

  void resize() {

  }

  void update(double t) {

  }

}