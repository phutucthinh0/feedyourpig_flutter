import 'package:flame/components.dart';

class MyFlame extends SpriteComponent{
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyFlame() : super(size: Vector2.all(16));
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('candy.png');
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    // We don't need to set the position in the constructor, we can set it directly here since it will
    // be called once before the first time it is rendered.
    position = gameSize / 2;
  }

}