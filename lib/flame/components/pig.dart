import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:flame/components.dart';

import '../../database.dart';

class Pig extends SpriteAnimationGroupComponent {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    int type = db.getPigCharacter();
    final stand_sprites = [1,2,3,4,5,4,3,2].map((i) => Sprite.load('pigs/pig${type}_stand${i}.png'));
    final stand_animation = SpriteAnimation.spriteList(
      await Future.wait(stand_sprites),
      stepTime: 0.04
    );
    final prepare_sprites = [1,2,3,4,5,4,3,2].map((i) => Sprite.load('pigs/pig${type}_eat${i}.png'));
    final prepare_animation = SpriteAnimation.spriteList(
        await Future.wait(prepare_sprites),
        stepTime: 0.04
    );
    final eat_sprites = [7,8,9,10].map((i) => Sprite.load('pigs/pig${type}_eat${i}.png'));
    final eat_animation = SpriteAnimation.spriteList(
        await Future.wait(eat_sprites),
        stepTime: 0.08
    );
    final sad_sprites = [1,2,3,4,5,6].map((i) => Sprite.load('pigs/pig${type}_sad${i}.png'));
    final sad_animation = SpriteAnimation.spriteList(
        await Future.wait(sad_sprites),
        stepTime: 0.06,
        loop: false
    );
    animations = {
      PigState.stand: stand_animation,
      PigState.prepare: prepare_animation,
      PigState.eat: eat_animation,
      PigState.sad: sad_animation
    };
    current = PigState.stand;
  }
}