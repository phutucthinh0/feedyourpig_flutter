import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class SwipeStart extends SpriteComponent{
  final int dx,dy;
  SwipeStart(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await Sprite.load('box/swipebox_start.png');
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
  }
}