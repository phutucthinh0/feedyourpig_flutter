import 'dart:ui';

import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:feedyourpig_flutter/flame/components/net.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'components/candy.dart';
import 'components/pig.dart';

class MainGame extends FlameGame with TapDetector{
  late SpriteAnimationGroupComponent pig;
  late SpriteComponent candy;
  late Component net;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    net = Net();
    add(net);
    // pig = Pig();
    // pig.size = Vector2(SystemConstant.unitSize*2, SystemConstant.unitSize*2);
    // add(pig);
    // candy = Candy();
    // candy.size = Vector2(SystemConstant.unitSize, SystemConstant.unitSize);
    // candy.changePriorityWithoutResorting(1);
    // add(candy);
  }
  @override
  void onTapDown(_) {
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
  Color backgroundColor() => Colors.transparent;
}