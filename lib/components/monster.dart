import 'dart:ui';
import 'package:bh_adv_00/adv-game.dart';

class Monster {
  final AdvGame game;
  Rect monsterRect;
  Paint monsterPaint;

  Monster(this.game, double x, double y, double width, double height) {
    print('monster is created : x=$x, y=$y, width=$width, height=$height');
    monsterRect = Rect.fromLTWH(x, y, width, height);
    monsterPaint = Paint();
    monsterPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas canvas) {
    canvas.drawRect(monsterRect, monsterPaint);
  }

  void update(double t) {

  }

  void onTapDown() {
    print('monster onTapDown!');
    monsterPaint.color = Color(0xffff4757);
  }
}