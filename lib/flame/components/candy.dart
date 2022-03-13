import 'package:feedyourpig_flutter/enum/candy_enum.dart';
import 'package:flame/components.dart';

class Candy extends SpriteAnimationGroupComponent {
  @override
  Future<void> onLoad() async{
    await super.onLoad();
    final normal_sprite = [Sprite.load('candy/candy0.png')];
    final normalAnimation = await SpriteAnimation.spriteList(
      await Future.wait(normal_sprite),
      stepTime: 10
    );

    final explosion1_sprites = [1,2,3,4,5,6,7,8,9,10].map((i) => Sprite.load('box/candy_explosion${i}.png'));
    final explosion1Animation = await SpriteAnimation.spriteList(
        await Future.wait(explosion1_sprites),
        stepTime: 0.05,
        loop: false
    );

    final explosion2_sprites = [1,2,3,4,5,6,7,8,9,].map((i) => Sprite.load('box/hidden_explosion${i}.png'));
    final explosion2Animation = await SpriteAnimation.spriteList(
        await Future.wait(explosion2_sprites),
        stepTime: 0.05,
        loop: false
    );

    animations = {
      CandyState.normal: normalAnimation,
      CandyState.explosion1: explosion1Animation,
      CandyState.explosion2: explosion2Animation
    };

    current = CandyState.normal;
  }
}