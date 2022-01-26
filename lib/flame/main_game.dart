import 'package:feedyourpig_flutter/flame/my_flame.dart';
import 'package:flame/game.dart';

class MainGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(MyFlame());
  }
}