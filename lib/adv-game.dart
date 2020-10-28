import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:bh_adv_00/components/hero.dart';
import 'package:bh_adv_00/components/monster.dart';
import 'package:bh_adv_00/helpers/directions.dart';

class AdvGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  Hero hero;
  List<Monster> monsters;

  String lastMove = '';
  double yMovement = 0;
  double xMovement = 0;

  AdvGame() {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    prepare();
    spawnMonster();
  }

  void prepare() {
    print("In prepare, screenSize.width=${screenSize.width}, screenSize.height=${screenSize.height}");
    hero = Hero(this,
        position: Offset(
          screenSize.width / 2,
          screenSize.height / 2,
        ),
    );

    monsters = List<Monster>();
  }

  void spawnMonster() {
    double monsterWidth = 50;
    double monsterHeight = 50;
    double x = rnd.nextDouble() * (screenSize.width - monsterWidth);
    double y = rnd.nextDouble() * (screenSize.height - monsterHeight);
    print('x=$x, y=$y');
    monsters.add(Monster(this, x, y, monsterWidth, monsterHeight));
  }

  void render(Canvas canvas) {
    if (screenSize == null) {
      return;
    }

    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    if (hero != null) {
      hero.render(canvas);
    } else {

    }

    monsters.forEach((Monster monster) => monster.render(canvas));
  }

  void update(double t) {
    if (hero != null) {
      hero.update(t);
    }

    if (lastMove == 'x') {
      if (xMovement < 0) {
        hero.direction = Direction.left;
        hero.position = hero.position.translate(-100 * t, 0);
      }
      if (xMovement > 0) {
        hero.direction = Direction.right;
        hero.position = hero.position.translate(100 * t, 0);
      }
    }
    if (lastMove == 'y') {
      if (yMovement < 0) {
        hero.direction = Direction.up;
        hero.position = hero.position.translate(0, -100 * t);
      }
      if (yMovement > 0) {
        hero.direction = Direction.down;
        hero.position = hero.position.translate(0, 100 * t);
      }
    }

    monsters.forEach((Monster monster) => monster.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    /*
    print('tap down is pressed!');
    monsters.forEach((Monster monster) {
      print('monster.left = ${monster.monsterRect.left}');
      print('globalPosition.left = ${d.globalPosition.dx}');
      if (monster.monsterRect.contains(d.globalPosition)) {
        print('contained!');
        monster.onTapDown();
      }
    });

    spawnMonster();
    */
  }

  void onUpTapDown(TapDownDetails d) {
    print('onUpDragStart is called');
    yMovement = -1;
    lastMove = 'y';
  }

  void onUpTapUp(TapUpDetails d) {
    print('onUpDragEnd is called');
    yMovement = 0;
  }

  void onRightTapDown(TapDownDetails d) {
    print('onRightDragStart is called');
    xMovement = 1;
    lastMove = 'x';
  }

  void onRightTapUp(TapUpDetails d) {
    print('onRightDragEnd is called');
    xMovement = 0;
  }

  void onDownTapDown(TapDownDetails d) {
    print('onDownDragStart is called');
    yMovement = 1;
    lastMove = 'y';
  }

  void onDownTapUp(TapUpDetails d) {
    print('onDownDragEnd is called');
    yMovement = 0;
  }

  void onLeftTapDown(TapDownDetails d) {
    print('onLeftDragStart is called');
    xMovement = -1;
    lastMove = 'x';
  }

  void onLeftTapUp(TapUpDetails d) {
    print('onLeftDragEnd is called');
    xMovement = 0;
  }

  void onFireTap() {
    print('onFireTap is called');
  }
}
