import 'dart:ui';

import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:feedyourpig_flutter/flame/my_flame.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class MainGame extends FlameGame with TapDetector{
  late SpriteAnimationGroupComponent pig;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    pig = MyFlame();
    add(pig);
  }
  @override
  void onTapDown(_) {
    print('he');
    pig.current = PigState.eat;
  }

  @override
  void onTapCancel() {
    pig.current = PigState.stand;
  }

  @override
  void onTapUp(_) {
    pig.current = PigState.stand;
  } 

  @override
  Color backgroundColor() => const Color(0xFF222222);
}