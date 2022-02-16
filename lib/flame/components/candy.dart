import 'package:flame/components.dart';

class Candy extends SpriteComponent {
  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await Sprite.load('candy/candy0.png');
  }
}