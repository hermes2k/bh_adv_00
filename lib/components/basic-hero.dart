import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:bh_adv_00/components/base_character.dart';
import 'package:bh_adv_00/adv-game.dart';

class BasicHero extends BaseCharacter {
  BasicHero(AdvGame game, {Offset position, double width, double height}) : super(game, position: position, width: width, height: height) {
    characterSprite = List<Sprite>();
    characterSprite.add(Sprite('characters/my-hero-1.png'));
    characterSprite.add(Sprite('characters/my-hero-2.png'));
    characterSprite.add(Sprite('characters/my-hero-3.png'));
    characterSprite.add(Sprite('characters/my-hero-4.png'));
    characterSprite.add(Sprite('characters/my-hero-5.png'));
    deadSprite = Sprite('characters/my-hero-1.png');
  }
}