import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class _assetsHelper {
  bool isLoaded = false;
  List<Image> listMazeIcon = [
    Image.asset("assets/images/map_icon/ic_iron.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_wood.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_ice.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_tnt.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_swipe.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_ciment.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_space.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_thorn_ciment.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_hidden_bomb.png", width: 250, height: 250,),
    Image.asset("assets/images/map_icon/ic_mixture.png", width: 250, height: 250,)
  ];
  Image backgroundGameScreen =   Image(width: double.infinity, height: double.infinity, image: AssetImage('assets/images/background/background.png'), fit: BoxFit.cover);
  List<String> listMazeName = ["Iron Maze", "Wood Maze", "Ice Maze", "TNT Maze", "Swipe Maze", "Liquid Cement Maze", "Space Maze", "Thorn Cement Maze", "Hidden Bomb Maze", "Mixture Maze"];
  List<String> listBackgroundAddress = ["assets/images/background/bg_iron.png", "assets/images/background/bg_wood.png", "assets/images/background/bg_ice.png", "assets/images/background/bg_tnt.png", "assets/images/background/bg_swipe.png", "assets/images/background/bg_liquid_cement.png", "assets/images/background/bg_space.png", "assets/images/background/bg_thorn_cement.png", "assets/images/background/bg_hidden.png", "assets/images/background/bg_mixture.png"];
  _assetsHelper();
}
// ignore: non_constant_identifier_names
_assetsHelper AssetsHelper = _assetsHelper();
