import 'package:flame/components.dart';

import '../../constants/system_constant.dart';

class TntEffect extends SpriteComponent{
  final int dx,dy;
  TntEffect(this.dx, this.dy);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await Sprite.load('box/tntbox_1.png');
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
  }
}