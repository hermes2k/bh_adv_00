import 'package:flutter/material.dart';
import 'package:bh_adv_00/adv-game.dart';

class GameController extends StatelessWidget {
  final AdvGame game;

  const GameController({Key key, @required this.game}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Row(
          children: [
            SizedBox(width: 48),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(width: 50),
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_up, size: 32),
                        ),
                      ),
                      onTapDown: game.onUpTapDown,
                      onTapUp: game.onUpTapUp,
                    ),
                    SizedBox(width: 50),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_left, size: 32),
                        ),
                      ),
                      onTapDown: game.onLeftTapDown,
                      onTapUp: game.onLeftTapUp,
                    ),
                    SizedBox(width: 50),
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_right, size: 32),
                        ),
                      ),
                      onTapDown: game.onRightTapDown,
                      onTapUp: game.onRightTapUp,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_down, size: 32),
                        ),
                      ),
                      onTapDown: game.onDownTapDown,
                      onTapUp: game.onDownTapUp,
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ]
            ),
            Spacer(),     // big empty space in the middle
            Center(
              child: GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  color: Color(0xffffffff),
                  child: Center(
                    child: Icon(Icons.new_releases, size: 48),
                  ),
                ),
                onTap: game.onFireTap,
              ),
            ),
            SizedBox(width: 48),     // right of the fire button
          ],
        ),
        SizedBox(height: 18),
      ],
    );
  }
}