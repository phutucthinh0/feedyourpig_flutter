import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class Thorn extends SpriteComponent{
  final int dx,dy;
  Thorn(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await Sprite.load('box/thornbox.png');
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
  }
}