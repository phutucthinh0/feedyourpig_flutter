import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class SpaceRed extends SpriteAnimationComponent {
  final int dx,dy;
  SpaceRed(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    size = Vector2.all(SystemConstant.unitSize*1.8);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*(dx-0.4), SystemConstant.spaceHeight + SystemConstant.unitSize*(dy-0.4));

    final sprites = [1,2,3,4,5,6,7,8].map((i) => Sprite.load('box/space_red_$i.png'));
    animation = SpriteAnimation.spriteList(
      await Future.wait(sprites),
      stepTime: 0.04,
    );
  }
}