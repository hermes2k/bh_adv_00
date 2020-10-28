import 'dart:ui';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:bh_adv_00/adv-game.dart';
import 'package:bh_adv_00/helpers/directions.dart';

class MyHero {
  final AdvGame game;
  Offset position = Offset.zero;
  Direction direction = Direction.up;

  double bodyAngle = 0;
  double targetBodyAngle;

  MyHero(this.game, {this.position});

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

  }

  void resize() {

  }

  void update(double t) {

    if (targetBodyAngle == null) {
      return;
    }

    final double rotationRate = pi * t;

    if (bodyAngle == targetBodyAngle) {
      position = position + Offset.fromDirection(bodyAngle, 100 * t);
    } else {
      position = position + Offset.fromDirection(bodyAngle, 50 * t);
    }

    if (targetBodyAngle != null) {
      if (bodyAngle < targetBodyAngle) {
        if ((targetBodyAngle - bodyAngle).abs() > pi) {
          bodyAngle = bodyAngle - rotationRate;
          if (bodyAngle < -pi) {
            bodyAngle += pi * 2;
          }
        } else {
          bodyAngle = bodyAngle + rotationRate;
          if (bodyAngle > targetBodyAngle) {
            bodyAngle = targetBodyAngle;
          }
        }
      }
      if (bodyAngle > targetBodyAngle) {
        if ((targetBodyAngle - bodyAngle).abs() > pi) {
          bodyAngle = bodyAngle + rotationRate;
          if (bodyAngle > pi) {
            bodyAngle -= pi * 2;
          }
        } else {
          bodyAngle = bodyAngle - rotationRate;
          if (bodyAngle < targetBodyAngle) {
            bodyAngle = targetBodyAngle;
          }
        }
      }
    }
  }

}