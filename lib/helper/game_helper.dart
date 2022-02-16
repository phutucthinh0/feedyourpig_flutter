import 'dart:convert';

import 'package:feedyourpig_flutter/models/map_model.dart';
import 'package:feedyourpig_flutter/models/maze_model.dart';
import 'package:flutter/services.dart';

class GameHelper {
  Future<List<MazeModel>> getListMaze() async {
    List<MazeModel> _list = [];
    Map<String, dynamic> _data = jsonDecode(await rootBundle.loadString('assets/game.json'));
    _data['maze'].forEach((e){
      _list.add(MazeModel(name: e, starts: 0));
    });
    return _list;
  }
  Future<MapModel> getMap(MazeModel mazeModel, int index) async{
    Map<String, dynamic> _data = jsonDecode(await rootBundle.loadString('assets/game.json'));
    return MapModel.initData(_data[mazeModel.name][index]);
  }
}
