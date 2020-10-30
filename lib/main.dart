import 'package:flame/util.dart';
import 'package:flame/flame.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bh_adv_00/adv-game.dart';
import 'package:bh_adv_00/widgets/joypad.dart';
import 'package:bh_adv_00/widgets/button.dart';

import 'package:bh_adv_00/bgm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  await SystemChrome.setEnabledSystemUIOverlays([]);

  Flame.images.loadAll(<String>[
    'background/broken_lab.png',
    'characters/fox.png',
    'characters/my-hero-1.png',
    'characters/my-hero-2.png',
    'characters/my-hero-3.png',
    'characters/my-hero-4.png',
    'characters/my-hero-5.png',
    'icons/attack.png',
    'icons/backpack.png',
    'icons/use.png',
  ]);

  Flame.audio.loadAll([
    'bgm/bgm_00.mp3',
    'bgm/bgm_01.wav',
    'bgm/bgm_02.mp3',
  ]);

  await BGM.add('bgm/bgm_00.mp3');
  await BGM.add('bgm/bgm_01.wav');
  await BGM.add('bgm/bgm_02.mp3');

  Util flameUtil = Util();
/*
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
*/
  AdvGame game = AdvGame();

  runApp(
    MaterialApp(
      title: 'BH\'s Advanture!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Stack(
                  children: [
                    game.widget,
                    Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            SizedBox(width: 48),
                            Joypad(
                              onChange: game.onLeftJoypadChange,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Column(
                                  children:[
                                    Button(
                                      name: 'Attack',
                                      diameter: 32,
                                      onTapCallback: game.onButtonTap,
                                      pathToImage: 'assets/images/icons/attack.png',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Button(
                                  name: 'Backpack',
                                  diameter: 32,
                                  onTapCallback: game.onButtonTap,
                                  pathToImage: 'assets/images/icons/backpack.png',
                                ),
                                SizedBox(height: 12),
                                Button(
                                  name: 'Use',
                                  diameter: 48,
                                  onTapCallback: game.onButtonTap,
                                  pathToImage: 'assets/images/icons/use.png',
                                ),
                              ],
                            ),
                            SizedBox(width: 48),
                          ],
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );

  BGM.attachWidgetBindingListener();
  BGM.play(0);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}