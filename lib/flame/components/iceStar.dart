import 'package:feedyourpig_flutter/enum/ice_enum.dart';
import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class IceStar extends SpriteGroupComponent {
  final int dx,dy;
  IceStar(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
    final normalSprite = await Sprite.load('box/icestar.png');
    final effectSprite = await Sprite.load('box/icestar1.png');

    sprites = {
      IceStarState.normal: normalSprite,
      IceStarState.effect: effectSprite
    };
    current = IceStarState.normal;
  }
}