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
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/box_constant.dart';
import 'components/candy.dart';
import 'components/hidden_bomb.dart';
import 'components/iron.dart';
import 'components/pig.dart';
import 'components/star.dart';
import 'components/swipe_end.dart';
import 'components/swipe_start.dart';
import 'components/tnt.dart';
import 'components/wood.dart';

class MainGame extends FlameGame with TapDetector, VerticalDragDetector, HorizontalDragDetector{
  late SpriteAnimationGroupComponent pig;
  List<int> pig_p = [0,0];
  late SpriteComponent candy;
  List<List<Component?>> _listBox= List.generate(11, (index) => List.generate(19, (index) => null));
  List<int> candy_p = [0,0];
  List<int> candy_p_old = [0,0];
  late Component net;
  final GameController _gameController = Get.find();
  late MapModel _map;
  bool doingAnimationCandy = false;
  bool isWin = false;
  //initialize box
  List<int> box_star = [-1,-1,-1];
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _map = _gameController.map.value;
    net = Net();
    add(net);
    pig = Pig();
    pig.size = Vector2(SystemConstant.unitSize*2, SystemConstant.unitSize*2);
    pig_p[0] = _map.prepare![0];
    pig_p[1] = _map.prepare![1];
    pig.position = Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * (_map.prepare![0]-0.5),
        SystemConstant.spaceHeight + SystemConstant.unitSize * (_map.prepare![1] - 0.5)
    );
    pig.changePriorityWithoutResorting(1);
    add(pig);
    candy = Candy();
    candy.size = Vector2(SystemConstant.unitSize, SystemConstant.unitSize);
    candy.position = getPositionByMap(_map.prepare![2], _map.prepare![3]);
    candy_p[0] = _map.prepare![2];
    candy_p[1] = _map.prepare![3];
    candy_p_old[0] = _map.prepare![2];
    candy_p_old[1] = _map.prepare![3];
    candy.changePriorityWithoutResorting(2);
    add(candy);
    
  //  draw box from map
    for(int i=0; i<=10; i++)
      // ignore: curly_braces_in_flow_control_structures
      for(int j=0; j<=18;j++){
        switch (_map.game![i][j]){
          case Box.star: {
            _listBox[i][j] = Star(i, j);
            break;
          }
          case Box.iron:{
            _listBox[i][j] = Iron(i,j);
            break;
          }
          // case Box.thorn:{
          //   _listBox.add(Thorn(i,j));
          //   break;
          // }
          // case Box.wood:{
          //   _listBox.add(Wood(i,j));
          //   break;
          // }
          // case Box.hiddenBomb:{
          //   _listBox.add(HiddenBomb(i,j));
          //   break;
          // }
          // case Box.bottom:{
          //   _listBox.add(SwipeBottom(i,j));
          //   break;
          // }
          // case Box.end:{
          //   _listBox.add(SwipeEnd(i,j));
          //   break;
          // }
          // case Box.start:{
          //   _listBox.add(SwipeStart(i,j));
          //   break;
          // }
          // case Box.top:{
          //   _listBox.add(SwipeTop(i,j));
          //   break;
          // }
          // case Box.tnt:{
          //   _listBox.add(Tnt(i,j));
          //   break;
          // }
        }
      }
    for(int i=0; i<=10; i++)
      // ignore: curly_braces_in_flow_control_structures
      for(int j=0; j<=18;j++){
        if(_listBox[i][j] != null){
          add(_listBox[i][j]!);
        }
      }
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
  void onVerticalDragEnd(DragEndInfo info) {
    super.onVerticalDragEnd(info);
    if(info.velocity.y < 0){
      onSwipeTop();
    }
    if(info.velocity.y > 0){
      onSwipeBottom();
    }
  }

  @override
  void onHorizontalDragEnd(DragEndInfo info) {
    // TODO: implement onHorizontalDragEnd
    super.onHorizontalDragEnd(info);
    if(info.velocity.x < 0){
      onSwipeLeft();
    }
    if(info.velocity.x > 0){
      onSwipeRight();
    }
  }

  void onSwipeTop(){
    print('--------Swipe Top');
    if(doingAnimationCandy)return;
    for (int i = candy_p[1]; i >= 0; i--) {
      if (checkCandy(candy_p[0], i, 1)) break;
      if (i == 0) {
        onLose(-1);
        return;
      }
    }
    print('--------------aaaaaaaa-');
    animationCandy();
  }
  void onSwipeRight(){
    print('--------Swipe Right');
    if(doingAnimationCandy)return;
    for (int i = candy_p[0]; i <= 10; i++) {
      if (checkCandy(i, candy_p[1], 2)) break;
      if (i == 10) {
        onLose(-2);
        return;
      }
    }
    animationCandy();
  }
  void onSwipeBottom(){
    print('--------Swipe Bottom');
    if(doingAnimationCandy)return;
    for(int i=candy_p[1]; i<=18; i++){
      if(checkCandy(candy_p[0],i,3)) break;
      if(i==18){
        onLose(-3);
        return;
      }
    }
    animationCandy();
  }
  void onSwipeLeft(){
    print('--------Swipe Left');
    if(doingAnimationCandy)return;
    for (int i = candy_p[0]; i >= 0; i--) {
      if (checkCandy(i, candy_p[1], 4)) break;
      if (i == 0) {
        onLose(-4);
        return;
      }
    }
    animationCandy();
  }
  bool checkCandy(int candyX, int candyY, int swipeDirection){
    if (_map.game![candyX][candyY] == Box.star) {
      _map.game![candyX][candyY] = 0;
      box_star[0] = candyX;
      box_star[1] = candyY;
      box_star[2] = swipeDirection;
      candy_p[0] = candyX;
      candy_p[1] = candyY;
      // star_count++;
      // gameInterface.lightStar(star_count);
      return true;
    }
    if (_map.game![candyX][candyY] == Box.iron) {
      switch (swipeDirection) {
        case 1: {
          candy_p[1] = candyY + 1;
          break;
        }
        case 2: {
          candy_p[0] = candyX - 1;
          break;
        }
        case 3: {
          candy_p[1] = candyY - 1;
          break;
        }
        case 4: {
          candy_p[0] = candyX + 1;
          break;
        }
      }
      // checkPrepareWin();
      return true;
    }
    // Pig
    if (candyX == pig_p[0] && candyY == pig_p[1]) {
      isWin = true;
      candy_p[0] = candyX;
      candy_p[1] = candyY;
      return true;
    }
    return false;
  }
  void animationCandy()async{
    doingAnimationCandy = true;
    double _duration = 0.0;
    if(candy_p[0] != candy_p_old [0]){
      _duration = (candy_p[0] - candy_p_old[0]).abs() * 0.02;
    }else
    if(candy_p[1] != candy_p_old [1]){
      _duration = (candy_p[1] - candy_p_old[1]).abs() * 0.02;
    }
    await candy.add(MoveEffect.to(
        getPositionByMap(candy_p[0], candy_p[1]),
        EffectController(
          duration: _duration,
        )
    ));
    candy_p_old[0] = candy_p[0];
    candy_p_old[1] = candy_p[1];
    // Callback when effect completed
    Future.delayed(Duration(milliseconds: (_duration*1000).toInt()),(){
      doingAnimationCandy = false;
      checkAnimationCandyEnd();
      print('On end');
    });
  }
  void checkAnimationCandyEnd(){
    // Box star
    if(box_star[0]!= -1){
      _listBox[box_star[0]][box_star[1]]!.add(RemoveEffect());
      _gameController.addLightStar();
      box_star[0]= -1;
      switch (box_star[2]){
        case 1:{
          onSwipeTop();
          break;
        }
        case 2:{
          onSwipeRight();
          break;
        }
        case 3:{
          onSwipeBottom();
          break;
        }
        case 4:{
          onSwipeLeft();
          break;
        }
      }
    }
    if(isWin){
      candy.add(RemoveEffect());
      pig.current = PigState.eat;
    }
  }
  void onLose(int type){
    double _duration = 0;
    switch (type){
      case -2:{
        _duration = (12 - candy_p_old[0]).abs() * 0.02;
        candy.add(MoveEffect.to(
            getPositionByMap(12, candy_p[1]),
            EffectController(
              duration: _duration,
            )
        ));
        break;
      }
      case -3:{
        _duration = (20 - candy_p_old[1]).abs() * 0.02;
        candy.add(MoveEffect.to(
            getPositionByMap(candy_p[0], 20),
            EffectController(
              duration: _duration,
            )
        ));
        break;
      }
      case -4:{
        _duration = (-2 - candy_p_old[0]).abs() * 0.02;
        candy.add(MoveEffect.to(
            getPositionByMap(-2, candy_p[1]),
            EffectController(
              duration: _duration,
            )
        ));
        break;
      }
    }
  }
  Vector2 getPositionByMap(int dx, int dy){
    return Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * dx,
        SystemConstant.spaceHeight + SystemConstant.unitSize * dy
    );
  }
  @override
  Color backgroundColor() => Colors.transparent;
}