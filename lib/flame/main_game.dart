import 'dart:math';
import 'dart:ui';

import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:feedyourpig_flutter/controllers/game_controller.dart';
import 'package:feedyourpig_flutter/enum/candy_enum.dart';
import 'package:feedyourpig_flutter/enum/ice_enum.dart';
import 'package:feedyourpig_flutter/enum/pig_enum.dart';
import 'package:feedyourpig_flutter/enum/thorn_cement_enum.dart';
import 'package:feedyourpig_flutter/flame/components/cement.dart';
import 'package:feedyourpig_flutter/flame/components/hand.dart';
import 'package:feedyourpig_flutter/flame/components/iceStar.dart';
import 'package:feedyourpig_flutter/flame/components/liquidCement.dart';
import 'package:feedyourpig_flutter/flame/components/net.dart';
import 'package:feedyourpig_flutter/flame/components/spaceBlue.dart';
import 'package:feedyourpig_flutter/flame/components/swipe_bottom.dart';
import 'package:feedyourpig_flutter/flame/components/swipe_top.dart';
import 'package:feedyourpig_flutter/flame/components/thorn.dart';
import 'package:feedyourpig_flutter/flame/components/thornCement.dart';
import 'package:feedyourpig_flutter/flame/components/tntEffect.dart';
import 'package:feedyourpig_flutter/models/map_model.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/box_constant.dart';
import '../helper/game_helper.dart';
import '../utils/system/audio_utils.dart';
import 'components/candy.dart';
import 'components/hidden_bomb.dart';
import 'components/ice.dart';
import 'components/iron.dart';
import 'components/pig.dart';
import 'components/spaceRed.dart';
import 'components/star.dart';
import 'components/swipe_end.dart';
import 'components/swipe_start.dart';
import 'components/tnt.dart';
import 'components/wood.dart';

class MainGame extends FlameGame with VerticalDragDetector, HorizontalDragDetector, KeyboardEvents{
  bool isHelp = false;
  int stepHelp = 0;
  SpriteComponent? hand;
  late SpriteAnimationGroupComponent pig;
  List<int> pig_p = [0,0];
  late SpriteAnimationGroupComponent candy;
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
  bool box_thorn_kill = false;
  List<int> box_wood = [-1,-1,-1];
  List<int> box_ice = [-1,-1];
  List<int> box_icestar = [-1,-1];
  List<int> box_tnt = [-1,-1,-1];
  bool is_tnt_effect = false;
  int box_swipe = 0;
  int box_liquid_cement = 0;
  List<int> box_space = [-1,-1];
  List<int> box_space_disapear  = [-1,-1,-1];
  List<int> box_cement_thorn = [-1,-1];
  bool box_hidden_bomb_kill =false;
  //Special effect box
  bool special_box = false;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    isHelp = _gameController.isHelp.value;
    _gameController.lightStar(0);
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
  //  Draw ic_handle if isHelp
    if(isHelp){
      hand = Hand(candy_p[0], candy_p[1], _map.help![stepHelp]);
      add(hand!);
    }
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
          case Box.thorn:{
            _listBox[i][j] = Thorn(i,j);
            break;
          }
          case Box.wood:{
            _listBox[i][j] = Wood(i,j);
            break;
          }
          case Box.ice:{
            _listBox[i][j] = Ice(i,j);
            break;
          }
          case Box.iceStar:{
            _listBox[i][j] = IceStar(i,j);
            break;
          }
          case Box.tnt:{
            _listBox[i][j] = Tnt(i,j);
            break;
          }
          case Box.start:{
            _listBox[i][j] = SwipeStart(i,j);
            break;
          }
          case Box.top:{
            _listBox[i][j] = SwipeTop(i,j);
            break;
          }
          case Box.end:{
            _listBox[i][j] = SwipeEnd(i,j);
            break;
          }
          case Box.bottom:{
            _listBox[i][j] = SwipeBottom(i,j);
            break;
          }
          case Box.liquidCement:{
            _listBox[i][j] = LiquidCement(i,j);
            break;
          }
          case Box.cement:{
            _listBox[i][j] = Cement(i,j);
            break;
          }
          case Box.spaceBlue:{
            _listBox[i][j] = SpaceBlue(i,j);
            break;
          }
          case Box.spaceRed:{
            _listBox[i][j] = SpaceRed(i,j);
            break;
          }
          case Box.cementThorn:{
            _listBox[i][j] = ThornCement(i,j);
            break;
          }
          case Box.hiddenBomb:{
            _listBox[i][j] = HiddenBomb(i,j);
            Future.delayed(Duration(seconds: 6),(){
              remove(_listBox[i][j]!);
            });
            break;
          }
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
  void onVerticalDragEnd(DragEndInfo info) {
    super.onVerticalDragEnd(info);
    if(info.velocity.y < 0){
      AudioUtils.swipe();
      if(isHelp){
        if(_map.help![stepHelp]==1){
          stepHelp++;
          drawHand();
          onSwipeTop();
        }
      }else{
        onSwipeTop();
      }
    }
    if(info.velocity.y > 0){
      AudioUtils.swipe();
      if(isHelp){
        if(_map.help![stepHelp]==3){
          stepHelp++;
          drawHand();
          onSwipeBottom();
        }
      }else{
        onSwipeBottom();
      }
    }
  }

  @override
  void onHorizontalDragEnd(DragEndInfo info) {
    // TODO: implement onHorizontalDragEnd
    super.onHorizontalDragEnd(info);
    if(info.velocity.x < 0){
      AudioUtils.swipe();
      if(isHelp){
        if(_map.help![stepHelp]==4){
          stepHelp++;
          drawHand();
          onSwipeLeft();
        }
      }else{
        onSwipeLeft();
      }
    }
    if(info.velocity.x > 0){
      AudioUtils.swipe();
      if(isHelp){
        if(_map.help![stepHelp]==2){
          stepHelp++;
          drawHand();
          onSwipeRight();
        }
      }else{
        onSwipeRight();
      }
    }
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event,
      Set<LogicalKeyboardKey> keysPressed,
      ) {
    final isKeyDown = event is RawKeyDownEvent;
    final isMoveTop = keysPressed.contains(LogicalKeyboardKey.arrowUp)||keysPressed.contains(LogicalKeyboardKey.keyW);
    final isMoveBottom = keysPressed.contains(LogicalKeyboardKey.arrowDown)||keysPressed.contains(LogicalKeyboardKey.keyS);
    final isMoveLeft = keysPressed.contains(LogicalKeyboardKey.arrowLeft)||keysPressed.contains(LogicalKeyboardKey.keyA);
    final isMoveRight = keysPressed.contains(LogicalKeyboardKey.arrowRight)||keysPressed.contains(LogicalKeyboardKey.keyD);
    if(isKeyDown){
      if(isMoveTop){
        AudioUtils.swipe();
        if(isHelp){
          if(_map.help![stepHelp]==1){
            stepHelp++;
            drawHand();
            onSwipeTop();
          }
        }else{
          onSwipeTop();
        }
        return KeyEventResult.ignored;
      }
      if(isMoveBottom){
        AudioUtils.swipe();
        if(isHelp){
          if(_map.help![stepHelp]==3){
            stepHelp++;
            drawHand();
            onSwipeBottom();
          }
        }else{
          onSwipeBottom();
        }
        return KeyEventResult.ignored;
      }
      if(isMoveLeft){
        AudioUtils.swipe();
        if(isHelp){
          if(_map.help![stepHelp]==4){
            stepHelp++;
            drawHand();
            onSwipeLeft();
          }
        }else{
          onSwipeLeft();
        }
        return KeyEventResult.ignored;
      }
      if(isMoveRight){
        AudioUtils.swipe();
        if(isHelp){
          if(_map.help![stepHelp]==2){
            stepHelp++;
            drawHand();
            onSwipeRight();
          }
        }else{
          onSwipeRight();
        }
        return KeyEventResult.ignored;
      }
    }
    return KeyEventResult.ignored;
  }

  void onSwipeTop(){
    if(doingAnimationCandy)return;
    for (int i = candy_p[1]; i >= 0; i--) {
      if (checkCandy(candy_p[0], i, 1)) break;
      if (i == 0) {
        onLose(-1);
        return;
      }
    }
    animationCandy();
  }
  void onSwipeRight(){
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
      checkPrepareWin();
      return true;
    }
    if (_map.game![candyX][candyY] == Box.thorn) {
      candy_p[0] = candyX;
      candy_p[1] = candyY;
      box_thorn_kill = true;
      return true;
    }
    if (_map.game![candyX][candyY] == Box.wood) {
      switch (swipeDirection) {
        case 1: {
          candy_p[1] = candyY + 1;
          if ((candyY == 0) || ((_map.game![candyX][candyY - 1] != 0)&&(_map.game![candyX][candyY - 1] != Box.star)&&(_map.game![candyX][candyY - 1] != Box.hiddenBomb))) {
            checkPrepareWin();
            return true;
          }
          break;
        }
        case 2: {
          candy_p[0] = candyX - 1;
          if ((candyX == 10) || ((_map.game![candyX + 1][candyY] != 0)&&(_map.game![candyX + 1][candyY] != Box.star)&&(_map.game![candyX + 1][candyY] != Box.hiddenBomb))){
            checkPrepareWin();
            return true;
          }
          break;
        }
        case 3: {
          candy_p[1] = candyY - 1;
          if ((candyY == 18) || ((_map.game![candyX][candyY + 1] != 0)&&(_map.game![candyX][candyY + 1] != Box.star)&&(_map.game![candyX][candyY + 1] != Box.hiddenBomb))){
            checkPrepareWin();
            return true;
          }
          break;
        }
        case 4: {
          candy_p[0] = candyX + 1;
          if ((candyX == 0) || ((_map.game![candyX - 1][candyY] != 0)&&(_map.game![candyX - 1][candyY] != Box.star)&&(_map.game![candyX - 1][candyY] != Box.hiddenBomb))){
            checkPrepareWin();
            return true;
          }
          break;
        }
      }
      _map.game![candyX][candyY] = 0;
      box_wood[0] = candyX;
      box_wood[1] = candyY;
      box_wood[2] = swipeDirection;
      checkPrepareWin();
      return true;
    }
    if (_map.game![candyX][candyY] == Box.ice) {
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
      box_ice[0] = candyX;
      box_ice[1] = candyY;
      checkPrepareWin();
      return true;
    }
    if (_map.game![candyX][candyY] == Box.iceEffect) {
      return true;
    }
    if(_map.game![candyX][candyY] == Box.iceStar){
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
      box_icestar[0] = candyX;
      box_icestar[1] = candyY;
      checkPrepareWin();
      return true;
    }
    if (_map.game![candyX][candyY] == Box.iceStarEffect) {
      return true;
    }
    if (_map.game![candyX][candyY] == Box.tnt) {
      switch (swipeDirection) {
        case 1: {
          candy_p[1] = candyY + 1;
          if ((candyY == 0) || (_map.game![candyX][candyY - 1] != 0)) {
            checkPrepareWin();
            AudioUtils.explosion();
            tnt_effect(candyX, candyY);
            return true;
          }
          break;
        }
        case 2: {
          candy_p[0] = candyX - 1;
          if ((candyX == 10) || (_map.game![candyX + 1][candyY] != 0)) {
            AudioUtils.explosion();
            checkPrepareWin();
            tnt_effect(candyX, candyY);
            return true;
          }
          break;
        }
        case 3: {
          candy_p[1] = candyY - 1;
          if ((candyY == 18) || (_map.game![candyX][candyY + 1] != 0)) {
            AudioUtils.explosion();
            checkPrepareWin();
            tnt_effect(candyX, candyY);
            return true;
          }
          break;
        }
        case 4: {
          candy_p[0] = candyX + 1;
          if ((candyX == 0) || (_map.game![candyX - 1][candyY] != 0)) {
            AudioUtils.explosion();
            checkPrepareWin();
            tnt_effect(candyX, candyY);
            return true;
          }
          break;
        }
        default: {
        }
      }
      _map.game![candyX][candyY] = 0;
      box_tnt[0] = candyX;
      box_tnt[1] = candyY;
      box_tnt[2] = swipeDirection;
      checkPrepareWin();
      return true;
    }
    if (16<=_map.game![candyX][candyY]&&_map.game![candyX][candyY]<=19){
      if(candy_p[0]==candyX&&candy_p[1]==candyY)return false;
      candy_p[0]=candyX;
      candy_p[1]=candyY;
      switch (_map.game![candyX][candyY]){
        case Box.top:{
          box_swipe =1;
          break;
        }
        case Box.end:{
          box_swipe =2;
          break;
        }
        case Box.bottom:{
          box_swipe =3;
          break;
        }
        case Box.start:{
          box_swipe =4;
          break;
        }
      }
      return true;
    }
    if(_map.game![candyX][candyY] == Box.liquidCement){
      if(candy_p[0]==candyX&&candy_p[1]==candyY)return false;
      candy_p[0]=candyX;
      candy_p[1]=candyY;
      box_liquid_cement=swipeDirection;
      return true;
    }
    if(_map.game![candyX][candyY]==Box.cement){
      if(candy_p[0]==candyX&&candy_p[1]==candyY)return false;
      switch (swipeDirection){
        case 1:{
          candy_p[1]=candyY+1;
          break;
        }
        case 2:{
          candy_p[0]=candyX-1;
          break;
        }
        case 3:{
          candy_p[1]=candyY-1;
          break;
        }
        case 4:{
          candy_p[0]=candyX+1;
          break;
        }
      }
      checkPrepareWin();
      return true;
    }
    if(_map.game![candyX][candyY]==Box.spaceBlue||_map.game![candyX][candyY]== Box.spaceRed){
      if(candy_p[0]==candyX&&candy_p[1]==candyY)return false;
      candy_p[0]=candyX;
      candy_p[1]=candyY;
      box_space[0]=11*candyY+candyX;
      box_space[1]=_map.game![candyX][candyY];
      return true;
    }
    if(_map.game![candyX][candyY]==Box.cementThorn){
      switch (swipeDirection){
        case 1:{
          candy_p[1]=candyY+1;
          break;
        }
        case 2:{
          candy_p[0]=candyX-1;
          break;
        }
        case 3:{
          candy_p[1]=candyY-1;
          break;
        }
        case 4:{
          candy_p[0]=candyX+1;
          break;
        }
      }
      box_cement_thorn[0]=candyX;
      box_cement_thorn[1]=candyY;
      checkPrepareWin();
      return true;
    }
    if (_map.game![candyX][candyY]==Box.cementThornEffect){
      switch (swipeDirection){
        case 1:{
          candy_p[1]=candyY+1;
          break;
        }
        case 2:{
          candy_p[0]=candyX-1;
          break;
        }
        case 3:{
          candy_p[1]=candyY-1;
          break;
        }
        case 4:{
          candy_p[0]=candyX+1;
          break;
        }
      }
      return true;
    }
    if(_map.game![candyX][candyY]==Box.hiddenBomb){
      candy_p[0]=candyX;
      candy_p[1]=candyY;
      box_hidden_bomb_kill=true;
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
  void checkSpecialBox()async{
    for(int i=0; i<=10; i++){
      for(int j=0; j<=18;j++){
        if(_map.game![i][j] == Box.iceEffect){
          if((pow(candy_p[0]-i, 2) + pow(candy_p[1]-j, 2)) > 1){
            _map.game![i][j] = 0;
            SpriteAnimationGroupComponent ice =  _listBox[i][j]! as SpriteAnimationGroupComponent;
            ice.current = IceState.broken;
            Future.delayed(Duration(milliseconds: 450),(){
              remove(_listBox[i][j]!);
            });
          }
        }
        if(_map.game![i][j] == Box.iceStarEffect){
          if(((pow(candy_p[0]-i, 2) + pow(candy_p[1]-j, 2)) > 1)){
            doingAnimationCandy = true;
            _map.game![i][j] = Box.star;
            remove(_listBox[i][j]!);
            _listBox[i][j] = Ice(i,j, IceState.broken);
            add(_listBox[i][j]!);
            Future.delayed(Duration(milliseconds: 450),(){
              doingAnimationCandy = false;
              remove(_listBox[i][j]!);
              if(_map.game![i][j]==Box.star){
                _listBox[i][j] = Star(i,j);
                add(_listBox[i][j]!);
              }
            });
          }
        }
        if(_map.game![i][j] == Box.cementThornEffect){
          if((pow(candy_p[0]-i, 2) + pow(candy_p[1]-j, 2)) > 1){
            _map.game![i][j] = Box.thorn;
            SpriteAnimationGroupComponent thornCement =  _listBox[i][j]! as SpriteAnimationGroupComponent;
            thornCement.current = ThornCementState.broken;
            Future.delayed(Duration(milliseconds: 450),(){
              remove(_listBox[i][j]!);
              _listBox[i][j] = Thorn(i,j);
              add(_listBox[i][j]!);
            });
          }
        }
      }
    }
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
    if(special_box){
      checkSpecialBox();
    }
    candy_p_old[0] = candy_p[0];
    candy_p_old[1] = candy_p[1];

    // Callback when effect completed
    Future.delayed(Duration(milliseconds: (_duration*1000).toInt()),(){
      doingAnimationCandy = false;
      checkAnimationCandyEnd();
      print('On end');
    });
  }
  void checkAnimationCandyEnd()async{
    // Box star
    if(box_star[0]!= -1){
      _listBox[box_star[0]][box_star[1]]!.add(RemoveEffect());
      _gameController.addLightStar();
      switch(_gameController.lightStar.value){
        case 1:{
          AudioUtils.star1();
          break;
        }
        case 2:{
          AudioUtils.star2();
          break;
        }
        case 3:{
          AudioUtils.star3();
          break;
        }
      }
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
      return;
    }
    // Box thorn
    if(box_thorn_kill){
      onLose(-5);
      return;
    }
    // Box wood
    if(box_wood[0]!=-1){
      doingAnimationCandy = true;
      switch (box_wood[2]){
        case 1:{
          await _listBox[box_wood[0]][box_wood[1]]!.add(MoveEffect.to(
            getPositionByMap(box_wood[0], box_wood[1]-1),
            EffectController(
              duration: 0.02
            )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            if(_map.game![box_wood[0]][box_wood[1]-1] != Box.hiddenBomb){
              _map.game![box_wood[0]][box_wood[1]-1] = Box.wood;
              _listBox[box_wood[0]][box_wood[1]-1] = Wood(box_wood[0],box_wood[1]-1);
              add(_listBox[box_wood[0]][box_wood[1]-1]!);
              remove(_listBox[box_wood[0]][box_wood[1]]!);
            }else{
              hidden_bomb_effect(box_wood[0],box_wood[1] - 1);
            }
            box_wood[0] = -1;
          });
          break;
        }
        case 2:{
          await _listBox[box_wood[0]][box_wood[1]]!.add(MoveEffect.to(
              getPositionByMap(box_wood[0]+1, box_wood[1]),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            if(_map.game![box_wood[0]+1][box_wood[1]] != Box.hiddenBomb){
              _map.game![box_wood[0]+1][box_wood[1]] = Box.wood;
              _listBox[box_wood[0]+1][box_wood[1]] = Wood(box_wood[0]+1,box_wood[1]);
              add(_listBox[box_wood[0]+1][box_wood[1]]!);
              remove(_listBox[box_wood[0]][box_wood[1]]!);
            }else{
              hidden_bomb_effect(box_wood[0],box_wood[1] - 1);
            }
            box_wood[0] = -1;
          });
          break;
        }
        case 3:{
          await _listBox[box_wood[0]][box_wood[1]]!.add(MoveEffect.to(
              getPositionByMap(box_wood[0], box_wood[1]+1),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            if(_map.game![box_wood[0]][box_wood[1]+1] != Box.hiddenBomb){
              _map.game![box_wood[0]][box_wood[1]+1] = Box.wood;
              _listBox[box_wood[0]][box_wood[1]+1] = Wood(box_wood[0],box_wood[1]+1);
              add(_listBox[box_wood[0]][box_wood[1]+1]!);
              remove(_listBox[box_wood[0]][box_wood[1]]!);
            }else{
              hidden_bomb_effect(box_wood[0],box_wood[1] - 1);
            }
            box_wood[0] = -1;
          });
          break;
        }
        case 4:{
          await _listBox[box_wood[0]][box_wood[1]]!.add(MoveEffect.to(
              getPositionByMap(box_wood[0]-1, box_wood[1]),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            if(_map.game![box_wood[0]-1][box_wood[1]] != Box.hiddenBomb){
              _map.game![box_wood[0]-1][box_wood[1]] = Box.wood;
              _listBox[box_wood[0]-1][box_wood[1]] = Wood(box_wood[0]-1,box_wood[1]);
              add(_listBox[box_wood[0]-1][box_wood[1]]!);
              remove(_listBox[box_wood[0]][box_wood[1]]!);
            }else{
              hidden_bomb_effect(box_wood[0],box_wood[1] - 1);
            }
            box_wood[0] = -1;
          });
          break;
        }
      }
      return;
    }
    //Box ice
    if(box_ice[0]!=-1){
      SpriteAnimationGroupComponent ice =  _listBox[box_ice[0]][box_ice[1]]! as SpriteAnimationGroupComponent;
      ice.current = IceState.effect;
      _map.game![box_ice[0]][box_ice[1]] = Box.iceEffect;
      box_ice[0] = -1;
      special_box = true;
      return;
    }
    //Box ice star
    if(box_icestar[0]!=-1){
      SpriteGroupComponent iceStar =  _listBox[box_icestar[0]][box_icestar[1]]! as SpriteGroupComponent;
      iceStar.current = IceStarState.effect;
      _map.game![box_icestar[0]][box_icestar[1]] = Box.iceStarEffect;
      box_icestar[0] = -1;
      special_box = true;
      return;
    }
    //Box tnt
    if(box_tnt[0]!=-1){
      doingAnimationCandy = true;
      switch (box_tnt[2]){
        case 1:{
          await _listBox[box_tnt[0]][box_tnt[1]]!.add(MoveEffect.to(
              getPositionByMap(box_tnt[0], box_tnt[1]-1),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            _map.game![box_tnt[0]][box_tnt[1] - 1] = Box.tnt;
            _listBox[box_tnt[0]][box_tnt[1]-1] = Tnt(box_tnt[0],box_tnt[1]-1);
            add(_listBox[box_tnt[0]][box_tnt[1]-1]!);
            remove(_listBox[box_tnt[0]][box_tnt[1]]!);
            box_tnt[0] = -1;
          });
          break;
        }
        case 2:{
          await _listBox[box_tnt[0]][box_tnt[1]]!.add(MoveEffect.to(
              getPositionByMap(box_tnt[0]+1, box_tnt[1]),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            _map.game![box_tnt[0]+1][box_tnt[1]] = Box.tnt;
            _listBox[box_tnt[0]+1][box_tnt[1]] = Tnt(box_tnt[0]+1,box_tnt[1]);
            add(_listBox[box_tnt[0]+1][box_tnt[1]]!);
            remove(_listBox[box_tnt[0]][box_tnt[1]]!);
            box_tnt[0] = -1;
          });
          break;
        }
        case 3:{
          await _listBox[box_tnt[0]][box_tnt[1]]!.add(MoveEffect.to(
              getPositionByMap(box_tnt[0], box_tnt[1]+1),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            _map.game![box_tnt[0]][box_tnt[1]+1] = Box.tnt;
            _listBox[box_tnt[0]][box_tnt[1]+1] = Tnt(box_tnt[0],box_tnt[1]+1);
            add(_listBox[box_tnt[0]][box_tnt[1]+1]!);
            remove(_listBox[box_tnt[0]][box_tnt[1]]!);
            box_tnt[0] = -1;
          });
          break;
        }
        case 4:{
          await _listBox[box_tnt[0]][box_tnt[1]]!.add(MoveEffect.to(
              getPositionByMap(box_tnt[0]-1, box_tnt[1]),
              EffectController(
                  duration: 0.02
              )
          ));
          Future.delayed(Duration(milliseconds: 200),(){
            doingAnimationCandy = false;
            _map.game![box_tnt[0]-1][box_tnt[1]] = Box.tnt;
            _listBox[box_tnt[0]-1][box_tnt[1]] = Tnt(box_tnt[0]-1,box_tnt[1]);
            add(_listBox[box_tnt[0]-1][box_tnt[1]]!);
            remove(_listBox[box_tnt[0]][box_tnt[1]]!);
            box_tnt[0] = -1;
          });
          break;
        }
      }
    }
    //Box tnt effect
    if(is_tnt_effect){
      is_tnt_effect = false;
      for(int i=0; i<=10; i++){
        for(int j=0; j<=18;j++){
          if(_map.game![i][j]==Box.tntEffect){
            if(_listBox[i][j]!=null)remove(_listBox[i][j]!);
            _listBox[i][j] = TntEffect(i, j);
            add(_listBox[i][j]!);
          }
        }
      }
      Future.delayed(Duration(milliseconds: 50),(){
        for(int i=0; i<=10; i++){
          for(int j=0; j<=18;j++){
            if(_map.game![i][j]==Box.tntEffect){
              if(_listBox[i][j]!=null)remove(_listBox[i][j]!);
              _listBox[i][j]=null;
              _map.game![i][j]=0;
            }
          }
        }
      });
    }
    //Box swipe
    if(box_swipe!=0){
      switch (box_swipe) {
        case 1: {
          box_swipe = 0;
          onSwipeTop();
          break;
        }
        case 2: {
          box_swipe = 0;
          onSwipeRight();
          break;
        }
        case 3: {
          box_swipe = 0;
          onSwipeBottom();
          break;
        }
        case 4: {
          box_swipe = 0;
          onSwipeLeft();
          break;
        }
      }
      return;
    }
    //Box liquid cement
    if(box_liquid_cement!=0){
      _map.game![candy_p[0]][candy_p[1]]=Box.cement;
      remove(_listBox[candy_p[0]][candy_p[1]]!);
      _listBox[candy_p[0]][candy_p[1]] = Cement(candy_p[0],candy_p[1]);
      add(_listBox[candy_p[0]][candy_p[1]]!);
      switch (box_liquid_cement){
        case 1:{
          box_liquid_cement=0;
          onSwipeTop();
          break;
        }
        case 2:{
          box_liquid_cement=0;
          onSwipeRight();
          break;
        }
        case 3:{
          box_liquid_cement=0;
          onSwipeBottom();
          break;
        }
        case 4:{
          box_liquid_cement=0;
          onSwipeLeft();
          break;
        }
      }
      return;
    }
    //Box space
    if(box_space[0]!=-1){
      loop:
      for(int i = 0;i<=10;i++){
        for(int j =0;j<=18;j++){
          if (_map.game![i][j]==box_space[1]&&((11*j+i)!=box_space[0])){
            candy.add(
              OpacityEffect.fadeOut(
                EffectController(
                  duration: 0.02
                )
              )
            );
            candy.position = getPositionByMap(i, j);
            candy.add(
                OpacityEffect.fadeIn(
                    EffectController(
                        duration: 0.02,
                        startDelay: 0.02
                    )
                )
            );
            box_space[0]=-1;
            candy_p[0] = i;
            candy_p[1] = j;
            candy_p_old[0] = i;
            candy_p_old[1] =j;
            box_space_disapear[0]=i;
            box_space_disapear[1]=j;
            box_space_disapear[2]=0;
            checkPrepareWin();
            break loop;
          }
        }
      }
      return;
    }
    //Box thorn cement
    if(box_cement_thorn[0]!=-1){
      SpriteAnimationGroupComponent thornCement =  _listBox[box_cement_thorn[0]][box_cement_thorn[1]]! as SpriteAnimationGroupComponent;
      thornCement.current = ThornCementState.effect;
      _map.game![box_cement_thorn[0]][box_cement_thorn[1]] = Box.cementThornEffect;
      box_cement_thorn[0] = -1;
      special_box = true;
      return;
    }
    //Box hidden bomb
    if(box_hidden_bomb_kill){
      onLose(-6);
      return;
    }

    if(isWin){
      candy.add(RemoveEffect());
      pig.current = PigState.eat;
      AudioUtils.eating();
      onWin();
      if(isHelp) remove(hand!);
      return;
    }
  }
  void drawHand(){
    if(stepHelp<_map.help!.length){
      Future.delayed(Duration(milliseconds: 200),(){
        remove(hand!);
        hand = Hand(candy_p[0],candy_p[1],_map.help![stepHelp]);
        add(hand!);
      });
    }
  }
  void tnt_effect(int x, int y){
    is_tnt_effect = true;
    _map.game![x][y] = 0;
    for (int j = y - 1; j <= y + 1; j++)
      // ignore: curly_braces_in_flow_control_structures
      for (int i = x - 1; i <= x + 1; i++) {
        if (i < 0 || i > 10 || j < 0 || j > 18) continue;
        if (_map.game![i][j] != Box.spaceBlue && _map.game![i][j] != Box.spaceRed)
          // ignore: curly_braces_in_flow_control_structures
          if (_map.game![i][j] != Box.tnt) {
            _map.game![i][j] = Box.tntEffect;
          } else {
            tnt_effect(i, j);
          }
      }
  }
  void onLose(int type){
    AudioUtils.lose();
    double _duration = 0;
    switch (type){
      case -1:{
        _duration = 0.1;
        candy.add(MoveEffect.to(
            Vector2(
              SystemConstant.spaceWidth + SystemConstant.unitSize * candy_p[0],
              - SystemConstant.unitSize
            ),
            EffectController(
              duration: _duration,
            )
        ));
        break;
      }
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
      case -5:{
        _duration = 0.25;
        candy.current = CandyState.explosion1;
        break;
      }
      case -6:{
        _map.game![candy_p[0]][candy_p[1]] = 0;
        for(int i=0; i<=10; i++)
          // ignore: curly_braces_in_flow_control_structures
          for(int j=0; j<=18;j++){
            if(_map.game![i][j]==Box.hiddenBomb){
              add(HiddenBomb(i, j));
            }
          }
        _duration = 0.25;
        candy.current = CandyState.explosion2;
        break;
      }
    }
    Future.delayed(Duration(milliseconds: (_duration*1000).toInt()),(){
      pig.current = PigState.sad;
      Future.delayed(Duration(milliseconds: 500),()async{
        _gameController.map(await GameHelper.getMap(_gameController.maze.value, _gameController.choose_map_id.value));
        _gameController.replay(true);
      });
    });
  }
  void onWin(){
    AudioUtils.win();
    _gameController.isHelp(false);
    Future.delayed(Duration(milliseconds: 500),(){
      _gameController.next(true);
    });
  }
  void checkPrepareWin(){
    int check = 0;
    bool isPrepareWin = false;
    if (candy_p[0] == pig_p[0]) {
      if (candy_p[1] < pig_p[1]) {
        for (int i = candy_p[1] + 1; i < pig_p[1]; i++) {
          check += _map.game![candy_p[0]][i];
        }
      }
      if (candy_p[1] > pig_p[1]) {
        for (int i = candy_p[1] - 1; i > pig_p[1]; i--) {
          check += _map.game![candy_p[0]][i];
        }
      }
      isPrepareWin = check == 0;
    } else if (candy_p[1] == pig_p[1]) {
      if (candy_p[0] < pig_p[0]) {
        for (int i = candy_p[0] + 1; i < pig_p[0]; i++) {
          check += _map.game![i][candy_p[1]];
        }
      }
      if (candy_p[0] > pig_p[0]) {
        for (int i = candy_p[0] - 1; i > pig_p[0]; i--) {
          check += _map.game![i][candy_p[1]];
        }
      }
      isPrepareWin = check == 0;
    } else {
      isPrepareWin = false;
    }
    if(isPrepareWin){
      pig.current = PigState.prepare;
    }else{
      pig.current = PigState.stand;
    }
  }
  Vector2 getPositionByMap(int dx, int dy){
    return Vector2(
        SystemConstant.spaceWidth + SystemConstant.unitSize * dx,
        SystemConstant.spaceHeight + SystemConstant.unitSize * dy
    );
  }
  void hidden_bomb_effect(int x, int y){
    _map.game![x][y] = Box.tntEffect;
    if(_listBox[x][y]!=null)remove(_listBox[x][y]!);
    _listBox[x][y] = TntEffect(x, y);
    add(_listBox[x][y]!);
    Future.delayed(Duration(milliseconds: 50),(){
      if(_listBox[x][y]!=null)remove(_listBox[x][y]!);
      _listBox[x][y]=null;
      _map.game![x][y]=0;
    });
    AudioUtils.explosion();
  }
  @override
  Color backgroundColor() => Colors.transparent;
}