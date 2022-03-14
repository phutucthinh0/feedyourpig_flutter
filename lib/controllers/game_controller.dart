import 'package:feedyourpig_flutter/models/map_model.dart';
import 'package:feedyourpig_flutter/models/maze_model.dart';
import 'package:get/get.dart';

import '../enum/screen_enum.dart';

class GameController extends GetxController{
  var maze = MazeModel(name: '', starts: 0).obs;
  var map = MapModel(game: null, help: null, prepare: null).obs;
  var screen = (Screen.ChooseMaze).obs;
  var lightStar = 0.obs;
  void addLightStar(){
    lightStar(lightStar.value+1);
  }
  var replay = false.obs;
  var next = false.obs;
  var choose_map_id = 0.obs;
  var isHelp = false.obs;
}