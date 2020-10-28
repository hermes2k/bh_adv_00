import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bh_adv_00/adv-game.dart';
import 'package:bh_adv_00/game-controller.dart';
import 'package:bh_adv_00/widgets/joypad.dart';
import 'package:bh_adv_00/widgets/button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  await SystemChrome.setEnabledSystemUIOverlays([]);

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
                    //GameController(game: game),
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
                                      name: 'Button1',
                                      diameter: 32,
                                      onTap: game.onButtonTap,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Button(
                                  name: 'Button2',
                                  diameter: 32,
                                  onTap: game.onButtonTap,
                                ),
                                SizedBox(height: 12),
                                Button(
                                  name: 'Button3',
                                  diameter: 48,
                                  onTap: game.onButtonTap,
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

  /*
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          game.widget,
          //GameController(game: game),
          Column(
            children: [
              Spacer(),
              Row(
                children: [
                  SizedBox(width: 48),
                  Button(
                    onTap: game.onButtonTap,
                  ),
                  Spacer(),
                  Button(
                    onTap: game.onButtonTap,
                  ),
                  SizedBox(width: 48),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 48),
                  Joypad(
                    onChange: game.onLeftJoypadChange,
                  ),
                  Spacer(),
                  Joypad(
                    onChange: (Offset delta) => print(delta),
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
  );
  */

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}