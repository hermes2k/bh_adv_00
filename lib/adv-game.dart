import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:bh_adv_00/components/monster.dart';
import 'package:bh_adv_00/components/broken_lab.dart';

import 'package:bh_adv_00/components/basic-hero.dart';

class AdvGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  BrokenLab brokenLab;
  BasicHero myHero;
  List<Monster> monsters;

  String lastMove = '';
  double yMovement = 0;
  double xMovement = 0;

  AudioPlayer homeBGM;
  AudioPlayer playingBGM;

  AdvGame() {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    prepare();
    spawnMonster();

    homeBGM = await Flame.audio.loopLongAudio('bgm/bgm_00.mp3', volume: .25);
    homeBGM.pause();
    playingBGM = await Flame.audio.loopLongAudio('bgm/bgm_01.wav', volume: .25);
    playingBGM.pause();

    //playHomeBGM();
  }

  void prepare() {
    print("In prepare, screenSize.width=${screenSize.width}, screenSize.height=${screenSize.height}");

    brokenLab = BrokenLab(this);

    double width = 60;
    double height = 60;
    myHero = BasicHero(this,
        position: Offset(
          screenSize.width / 2,
          screenSize.height / 2,
        ),
        width: width,
        height: height
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

  void playHomeBGM() {
    playingBGM.pause();
    playingBGM.seek(Duration.zero);
    homeBGM.resume();
  }

  void playPlayingBGM() {
    homeBGM.pause();
    homeBGM.seek(Duration.zero);
    playingBGM.resume();
  }

  void render(Canvas canvas) {
    if (screenSize == null) {
      return;
    }

    if (brokenLab != null) {
      brokenLab.render(canvas);
    }

    if (myHero != null) {
      myHero.render(canvas);
    }

    monsters.forEach((Monster monster) => monster.render(canvas));
  }

  void update(double t) {
    if (myHero != null) {
      myHero.update(t);
    }
    monsters.forEach((Monster monster) => monster.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onLeftJoypadChange(Offset offset) {
    if (offset == Offset.zero) {
      myHero.targetBodyAngle = null;
    } else {
      myHero.targetBodyAngle = offset.direction;
    }
  }

  void onButtonTap() {
    print('button is pressed');
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
