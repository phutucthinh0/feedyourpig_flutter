import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../constants/system_constant.dart';

class Hand extends SpriteComponent{
  final int dx,dy;
  final int direction;
  Hand(this.dx, this.dy, this.direction);

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await Sprite.load('icon/ic_handle.png');
    size = Vector2.all(SystemConstant.unitSize);
    position = Vector2(SystemConstant.spaceWidth + SystemConstant.unitSize*dx, SystemConstant.spaceHeight + SystemConstant.unitSize*dy);
    switch(direction){
      case 1:{
        add(MoveEffect.to(
            Vector2(
                SystemConstant.spaceWidth + SystemConstant.unitSize*dx,
                SystemConstant.spaceHeight + SystemConstant.unitSize*(dy-3)),
            EffectController(duration: 1.5, reverseDuration: 0, infinite: true))
        );
        break;
      }
      case 2:{
        add(MoveEffect.to(
            Vector2(
                SystemConstant.spaceWidth + SystemConstant.unitSize*(dx+3),
                SystemConstant.spaceHeight + SystemConstant.unitSize*dy),
            EffectController(duration: 1.5, reverseDuration: 0, infinite: true))
        );
        break;
      }
      case 3:{
        add(MoveEffect.to(
            Vector2(
                SystemConstant.spaceWidth + SystemConstant.unitSize*dx,
                SystemConstant.spaceHeight + SystemConstant.unitSize*(dy+3)),
            EffectController(duration: 1.5, reverseDuration: 0, infinite: true))
        );
        break;
      }
      case 4:{
        add(MoveEffect.to(
            Vector2(
                SystemConstant.spaceWidth + SystemConstant.unitSize*(dx-3),
                SystemConstant.spaceHeight + SystemConstant.unitSize*dy),
            EffectController(duration: 1.5, reverseDuration: 0, infinite: true))
        );
        break;
      }
    }

  }
}