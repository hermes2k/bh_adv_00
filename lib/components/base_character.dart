import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:bh_adv_00/adv-game.dart';

class BaseCharacter {
  final AdvGame game;

  List<Sprite> characterSprite;
  Sprite deadSprite;
  double characterSpriteIndex = 0;

  Rect characterRect;

  bool isDead = false;
  bool isOffScreen = false;

  Offset position = Offset.zero;

  double targetBodyAngle;

  BaseCharacter(this.game, {this.position, double width, double height}) {
    characterRect = Rect.fromLTWH(0, 0, width, height);
  }

  void render(Canvas canvas) {

    canvas.save();
    canvas.translate(position.dx, position.dy);

    if (isDead) {
      deadSprite.renderRect(canvas, characterRect.inflate(2));
    } else {
      characterSprite[characterSpriteIndex.toInt()].renderRect(canvas, characterRect.inflate(2));
    }

    canvas.restore();
  }

  void resize() {

  }

  void update(double t) {
    if (isDead) {
      return;
    }

    // Select current index of sprite
    if (targetBodyAngle == null) {
      characterSpriteIndex = 0;
      return;
    }

    characterSpriteIndex += 5 * t;
    while (characterSpriteIndex >= 2) {
      characterSpriteIndex -= 2;
    }

    double speed = 180;
    position = position + Offset.fromDirection(targetBodyAngle, speed * t);
    print('position=$position, position.distance=${position.distance}, position.direction=${position.direction}');
  }
}