import 'dart:ui';

import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:feedyourpig_flutter/controllers/game_controller.dart';
import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:feedyourpig_flutter/flame/components/net.dart';
import 'package:feedyourpig_flutter/models/map_model.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/candy.dart';
import 'components/pig.dart';

class MainGame extends FlameGame with TapDetector{
  late SpriteAnimationGroupComponent pig;
  late SpriteComponent candy;
  late Component net;
  final GameController _gameController = Get.find();
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final MapModel _map = _gameController.map.value;
    net = Net();
    add(net);
    pig = Pig();
    pig.size = Vector2(SystemConstant.unitSize*2, SystemConstant.unitSize*2);
    pig.position = Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * (_map.prepare![0]-0.5),
        SystemConstant.spaceHeight + SystemConstant.unitSize * (_map.prepare![1] - 0.5)
    );
    add(pig);
    candy = Candy();
    candy.size = Vector2(SystemConstant.unitSize, SystemConstant.unitSize);
    candy.position = Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * _map.prepare![2],
        SystemConstant.spaceHeight + SystemConstant.unitSize * _map.prepare![3]
    );
    candy.changePriorityWithoutResorting(1);
    add(candy);
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