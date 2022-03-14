
import 'dart:async';
import 'package:feedyourpig_flutter/controllers/game_controller.dart';
import 'package:feedyourpig_flutter/helper/Assets_helper.dart';
import 'package:feedyourpig_flutter/helper/button_ui.dart';
import 'package:feedyourpig_flutter/helper/game_helper.dart';
import 'package:feedyourpig_flutter/helper/text_ui.dart';
import 'package:feedyourpig_flutter/models/maze_model.dart';
import 'package:feedyourpig_flutter/screens/gallery_screen.dart';
import 'package:feedyourpig_flutter/screens/play_screen.dart';
import 'package:feedyourpig_flutter/utils/system/audio_utils.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:feedyourpig_flutter/widgets/dialogs/dialog_win.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../enum/screen_enum.dart';
import '../widgets/dialogs/dialog_pause.dart';

class GameScreen extends StatefulWidget {
  final int index;
  const GameScreen({Key? key, this.index = 0}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  final GameController _gameController = Get.put(GameController());
  late List<MazeModel> _listMaze;
  var willScreen = Screen.ChooseMaze;
  bool _animBlack = false;
  late Image background_screen = Image(width: double.infinity, height: double.infinity, image: AssetImage(AssetsHelper.listBackgroundAddress[0]), fit: BoxFit.cover);
  int choose_maze_id = 0;
  // int choose_map_id = 0;
  // final controller = PageController(viewportFraction: 0.7);
  late PageController controller;
  double currentPage = 0.0;
  _handleSelectedMaze(int mazeId){
    AudioUtils.click();
    choose_maze_id = mazeId;
    _gameController.maze(_listMaze[mazeId]);
    background_screen = Image(width: double.infinity, height: double.infinity, image: AssetImage(AssetsHelper.listBackgroundAddress[mazeId]), fit: BoxFit.cover);
    willScreen = Screen.ChooseMap;
    print(mazeId);
    _handleBlackScreen();
  }
  _handleBackToMaze(){
    willScreen = Screen.ChooseMaze;
    _handleBlackScreen();
  }
  _handleSelectedMap(int mapId)async{
    AudioUtils.click();
    _gameController.choose_map_id(mapId);
    _gameController.map(await GameHelper.getMap(_gameController.maze.value, mapId));
    willScreen = Screen.Play;
    _handleBlackScreen();
  }
  _handleBackToMap(){
    willScreen = Screen.ChooseMap;
    _handleBlackScreen();
  }
  _handleBlackScreen([int duration = 400]){
    setState(() {
      // print('$index')
      _animBlack = true;
    });
  }
  _handleReplay()async{
    _gameController.map(await GameHelper.getMap(_gameController.maze.value, _gameController.choose_map_id.value));
    _gameController.replay(true);
  }
  _handleNext()async{
    if(_gameController.choose_map_id.value==24){
      _handleBackToMaze();
    }else{
      _gameController.choose_map_id(_gameController.choose_map_id.value+1);
      _gameController.map(await GameHelper.getMap(_gameController.maze.value, _gameController.choose_map_id.value));
      _gameController.replay(true);
    }
  }
  @override
  void initState() {
    super.initState();
    initStateAsync();
    controller = PageController(initialPage: widget.index, viewportFraction: 0.7);
    _gameController.next.listen((p0) async{
      if(p0){
        showDialogWin(context,
              ()=>_handleBackToMaze(),
              ()=>_handleBackToMap(),
              ()=>_handleReplay(),
              ()=>_handleNext()
        );
        _gameController.next(false);
      }
    });
  }
  initStateAsync() async{
    _listMaze = await GameHelper.getListMaze();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope (
        onWillPop: () async {
          if(_gameController.screen.value == Screen.ChooseMap){
            _handleBackToMaze();
            return false;
          }
          if(_gameController.screen.value == Screen.Play){
            _handleBackToMap();
            return false;
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: ContainerFlexible(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background/background.png"), fit: BoxFit.cover)),
            child: Stack(
              children: [
                Obx(()=> _buildScreen()),
                IgnorePointer(
                  ignoring: true,
                  child: AnimatedOpacity(
                    opacity: _animBlack ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 400),
                    onEnd: () {
                      if (_animBlack) {
                        Future.delayed(Duration(milliseconds: 50), () {
                          _gameController.screen(willScreen);
                          Future.delayed(Duration(milliseconds: 50), () {
                            setState(() {
                              _animBlack = false;
                            });
                          });
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  Widget _buildScreen(){
    switch(_gameController.screen.value){
      case Screen.ChooseMaze:{
        controller = PageController(initialPage: choose_maze_id, viewportFraction: 0.7);
        return Stack(
            children: [
              AssetsHelper.backgroundGameScreen,
              Align(alignment: Alignment.center,child: Image.asset('assets/images/pigs/pig0_stand1.png',width: 100,height: 100,)),
              PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AssetsHelper.listMazeIcon.length,
                  controller: controller,
                  itemBuilder: (context,index)=>
                      GestureDetector(
                        onTap: (){
                          _handleSelectedMaze(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 150,bottom:150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Align(alignment: Alignment.center,child:AssetsHelper.listMazeIcon[index])),
                              SizedBox(height: 10,),
                              TextUI(AssetsHelper.listMazeName[index],fontSize: 28)
                            ],
                          ),
                        ),
                      )
              ),
            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(bottom: 200),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 10,
                      effect: ScrollingDotsEffect(
                        maxVisibleDots: 5,
                        dotColor: Colors.white,
                        activeDotColor: Colors.orange,

                      ),
                    )
                )
            ),
              Align(
                alignment: Alignment.bottomLeft,
                child: buttonUI(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(bottom: 60,left: 25),
                  src: 'assets/images/icon/ic_back.png',
                  onTap: (){
                    AudioUtils.click();
                    Navigator.pop(context);
                  },
                ),
              ),

              // Container(
              //   margin: const EdgeInsets.only(top: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //     buttonUI(
              //       width: 55,
              //       height: 55,
              //       src: 'assets/images/icon/ic_change_candy.png',
              //       onTap: ()=>Get.to(()=>GalleryScreen(index: 1 ,) ),
              //     ),
              //
              //     buttonUI(
              //       width: 55,
              //       height: 55,
              //       src: 'assets/images/icon/ic_change_pig.png',
              //       onTap: ()=>Get.to(()=>GalleryScreen() ),
              //     ),
              //     SizedBox(width: 80,),
              //     TextUI('300',fontSize: 32,color: Colors.white,),
              //     Image.asset('assets/images/icon/ic_star.png',width: 35, height: 35,)
              //   ],),
              // )
            ]);
      }
      case Screen.ChooseMap:{
        return Stack(
          children: [
            background_screen,
            Align(
              alignment: Alignment.center,
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,mainAxisSpacing: 10),
                  itemCount: 25,
                  itemBuilder: (context,index) => GestureDetector(
                    onTap: (){
                      _handleSelectedMap(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/map_icon/ic_box.png"))
                      ),
                      child: Stack(children: [
                        Positioned(
                          left: 2,
                          bottom: 2,
                          child: TextUI((index+1).toString().length==1?" "+(index+1).toString():(index+1).toString(),fontSize: 18,color: Colors.white,),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              margin: EdgeInsets.only(top: 25,bottom: 15,left: 10,right: 10),
                              child: Image(image: AssetImage("assets/images/icon/ic_star_point_0.png"))),
                        )

                      ],),
                    ),
                  )
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: buttonUI(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(bottom: 60,left: 25),
                src: 'assets/images/icon/ic_back.png',
                onTap: (){
                  AudioUtils.click();
                  _handleBackToMaze();
                },

              ),
            ),
          ],
        );
      }
      case Screen.Play:{
        return Stack(
          children: [
            background_screen,
            PlayScreen(),
            Align(
              alignment: Alignment.topRight,
              child: buttonUI(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 10, right:  10),
                src: 'assets/images/icon/ic_pause.png',
                onTap: (){
                  AudioUtils.click();
                  showDialogPause(context, ()=>_handleBackToMaze(), ()=>_handleBackToMap());
                },
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: buttonUI(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 10, right:  60),
                src: 'assets/images/icon/ic_replay.png',
                onTap: (){
                  AudioUtils.click();
                  _handleReplay();
                },
              ),
            )
          ],
        );
      }
      default: return Container();
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
}
