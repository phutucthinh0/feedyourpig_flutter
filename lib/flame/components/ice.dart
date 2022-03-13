import 'package:feedyourpig_flutter/enum/ice_enum.dart';
import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class Ice extends SpriteAnimationGroupComponent {
  final int dx,dy;
  final IceState iceState;
  Ice(this.dx, this.dy, [this.iceState = IceState.normal]);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);

    final normal_sprite = [Sprite.load('box/icebox1.png')];
    final normalAnimation = await SpriteAnimation.spriteList(
        await Future.wait(normal_sprite),
        stepTime: 10
    );

    final effect_sprites = [2,3,4].map((i) => Sprite.load('box/icebox$i.png'));
    final effectgAnimation = await SpriteAnimation.spriteList(
        await Future.wait(effect_sprites),
        stepTime: 0.05,
    );

    final broken_sprites = [1,2,3,4,5,6,7,8,9].map((i) => Sprite.load('box/icebreak$i.png'));
    final brokenAnimation = await SpriteAnimation.spriteList(
      await Future.wait(broken_sprites),
      stepTime: 0.05,
      loop: false
    );

    animations = {
      IceState.normal: normalAnimation,
      IceState.effect: effectgAnimation,
      IceState.broken: brokenAnimation
    };

    current = iceState;
  }
}