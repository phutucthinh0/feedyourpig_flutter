import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:flame/components.dart';

class MyFlame extends SpriteAnimationGroupComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyFlame() : super(size: Vector2.all(150));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final standSprites = [1, 2, 3, 4, 5, 4, 3, 2].map((i) => Sprite.load('pig0_stand$i.png'));
    final eatSprites = [1, 2, 3, 4, 5, 4, 3, 2].map((i) => Sprite.load('pig0_eat$i.png'));
    final standAnim = SpriteAnimation.spriteList(
      await Future.wait(standSprites),
      stepTime: 0.04,
    );
    final eadAnim = SpriteAnimation.spriteList(
      await Future.wait(eatSprites),
      stepTime: 0.04,
    );
    animations = {
      PigState.stand: standAnim,
      PigState.eat:eadAnim
    };
    current = PigState.stand;
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    position = gameSize / 2;
  }
}
