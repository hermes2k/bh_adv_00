import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:bh_adv_00/adv-game.dart';

class BrokenLab {
  final AdvGame game;
  Sprite bgSprite;
  Rect bgRect;

  BrokenLab(this.game) {
    bgSprite = Sprite('background/broken_lab.png');
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
  }

  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  void update(Canvas canvas) {

  }
}