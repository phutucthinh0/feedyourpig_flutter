import 'dart:ui';

import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:feedyourpig_flutter/controllers/game_controller.dart';
import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:feedyourpig_flutter/flame/components/net.dart';
import 'package:feedyourpig_flutter/flame/components/swipe_bottom.dart';
import 'package:feedyourpig_flutter/flame/components/swipe_top.dart';
import 'package:feedyourpig_flutter/flame/components/thorn.dart';
import 'package:feedyourpig_flutter/models/map_model.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/box_constant.dart';
import 'components/candy.dart';
import 'components/hidden_bomb.dart';
import 'components/iron.dart';
import 'components/pig.dart';
import 'components/swipe_end.dart';
import 'components/swipe_start.dart';
import 'components/tnt.dart';
import 'components/wood.dart';

class MainGame extends FlameGame with TapDetector{
  late SpriteAnimationGroupComponent pig;
  late SpriteComponent candy;
  late Component net;
  final GameController _gameController = Get.find();
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final MapModel _map = _gameController.map.value;
    List<Component> _listBox= [];
    net = Net();
    add(net);
    pig = Pig();
    pig.size = Vector2(SystemConstant.unitSize*2, SystemConstant.unitSize*2);
    pig.position = Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * (_map.prepare![0]-0.5),
        SystemConstant.spaceHeight + SystemConstant.unitSize * (_map.prepare![1] - 0.5)
    );
    pig.changePriorityWithoutResorting(1);
    add(pig);
    candy = Candy();
    candy.size = Vector2(SystemConstant.unitSize, SystemConstant.unitSize);
    candy.position = Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * _map.prepare![2],
        SystemConstant.spaceHeight + SystemConstant.unitSize * _map.prepare![3]
    );
    candy.changePriorityWithoutResorting(2);
    add(candy);
    
  //  draw box from map
    for(int i=0; i<=10; i++)
      // ignore: curly_braces_in_flow_control_structures
      for(int j=0; j<=18;j++){
        switch (_map.game![i][j]){
          case Box.iron:{
            _listBox.add(Iron(i,j));
            break;
          }
          case Box.thorn:{
            _listBox.add(Thorn(i,j));
            break;
          }
          case Box.wood:{
            _listBox.add(Wood(i,j));
            break;
          }
          case Box.hiddenBomb:{
            _listBox.add(HiddenBomb(i,j));
            break;
          }
          case Box.bottom:{
            _listBox.add(SwipeBottom(i,j));
            break;
          }
          case Box.end:{
            _listBox.add(SwipeEnd(i,j));
            break;
          }
          case Box.start:{
            _listBox.add(SwipeStart(i,j));
            break;
          }
          case Box.top:{
            _listBox.add(SwipeTop(i,j));
            break;
          }
          case Box.tnt:{
            _listBox.add(Tnt(i,j));
            break;
          }
        }
      }
    addAll(_listBox);
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