import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class HiddenBomb extends SpriteAnimationComponent{
  final int dx,dy;
  HiddenBomb(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
    final sprite1 = await Sprite.load('box/hiddenbomd.png');
    final sprite2 = await Sprite.load('box/hiddenbomd_1.png');
    animation = SpriteAnimation.spriteList([sprite1, sprite2], stepTime: 0.1);
  }
}