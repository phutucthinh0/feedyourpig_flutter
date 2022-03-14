import 'package:feedyourpig_flutter/enum/thorn_cement_enum.dart';
import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class ThornCement extends SpriteAnimationGroupComponent{
  final int dx,dy;
  ThornCement(this.dx, this.dy);
  @override
  Future<void> onLoad() async{
    await super.onLoad();
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);

    final thornCementSprite = await Sprite.load('box/thornciment_n.png');
    final thornCementCautionSprite = await Sprite.load('box/thorncimentn1.png');
    final broken_sprites = [1,2,3,4,5,6,7,8,9].map((i) => Sprite.load('box/thornciment$i.png'));
    final normalAnimation = SpriteAnimation.spriteList([thornCementSprite], stepTime: 10);
    final effectAnimation = SpriteAnimation.spriteList([thornCementSprite, thornCementCautionSprite], stepTime: 0.1);
    final brokenAnimation = await SpriteAnimation.spriteList(
        await Future.wait(broken_sprites),
        stepTime: 0.05,
        loop: false
    );
    animations = {
      ThornCementState.normal: normalAnimation,
      ThornCementState.effect: effectAnimation,
      ThornCementState.broken: brokenAnimation
    };
    current = ThornCementState.normal;
  }
}