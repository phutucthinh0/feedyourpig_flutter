import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class Star extends SpriteComponent{
  final int dx,dy;
  Star(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await Sprite.load('icon/ic_star.png');
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
  }
}