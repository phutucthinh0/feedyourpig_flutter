
import 'dart:async';
import 'package:feedyourpig_flutter/helper/Assets_helper.dart';
import 'package:feedyourpig_flutter/helper/button_ui.dart';
import 'package:feedyourpig_flutter/helper/text_ui.dart';
import 'package:feedyourpig_flutter/screens/gallery_screen.dart';
import 'package:feedyourpig_flutter/screens/play_screen.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
enum Screen{
  ChooseMaze,ChooseMap,Play
}
class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  var screen = Screen.ChooseMaze;
  var willScreen = Screen.ChooseMaze;
  late Map<String,dynamic> jsonMain;
  bool _animBlack = false;
  late Image background_screen = Image(width: double.infinity, height: double.infinity, image: AssetImage(AssetsHelper.listBackgroundAddress[0]), fit: BoxFit.cover);
  int choose_maze_id = 0;
  int choose_map_id = 0;
  final _controller = PageController(viewportFraction: 0.7);
  double currentPage = 0.0;
  _handleSelectedMaze(int mazeId){
    choose_maze_id = mazeId;
    background_screen = Image(width: double.infinity, height: double.infinity, image: AssetImage(AssetsHelper.listBackgroundAddress[mazeId]), fit: BoxFit.cover);
    willScreen = Screen.ChooseMap;
    _handleBlackScreen();
  }
  _handleBackToMaze(){
    willScreen = Screen.ChooseMaze;
    _handleBlackScreen();
  }
  _handleSelectedMap(int mapId){
    choose_map_id = mapId;
    willScreen = Screen.Play;
    _handleBlackScreen();
  }
  _handleBackToMap(){
    willScreen = Screen.ChooseMap;
    _handleBlackScreen();
  }
  _handleBlackScreen([int duration = 400]){
    setState(() {
      _animBlack = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope (
        onWillPop: () async {
          if(screen == Screen.ChooseMap){
            _handleBackToMaze();
            return false;
          }
          if(screen == Screen.Play){
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
                _buildScreen(),
                IgnorePointer(
                  ignoring: true,
                  child: AnimatedOpacity(
                    opacity: _animBlack ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 400),
                    onEnd: () {
                      if (_animBlack) {
                        Future.delayed(Duration(milliseconds: 50), () {
                          setState(() {
                            screen = willScreen;
                          });
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
    switch(screen){
      case Screen.ChooseMaze:{
        return Stack(
            children: [
              AssetsHelper.backgroundGameScreen,
              Align(alignment: Alignment.center,child: Image.asset('assets/images/pigs/pig0_stand1.png',width: 100,height: 100,)),
              PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AssetsHelper.listMazeIcon.length,
                  controller: _controller,
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
                      controller: _controller,
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
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(bottom: 60,left: 25),
                  src: 'assets/images/icon/ic_back.png',
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  buttonUI(
                    width: 60,
                    height: 60,
                    src: 'assets/images/icon/ic_change_candy.png',
                    onTap: ()=>Get.to(()=>GalleryScreen(index: 1 ,) ),
                  ),

                  buttonUI(
                    width: 60,
                    height: 60,
                    src: 'assets/images/icon/ic_change_pig.png',
                    onTap: ()=>Get.to(()=>GalleryScreen() ),
                  ),
                  SizedBox(width: 80,),
                  TextUI('300',fontSize: 32,color: Colors.white,),
                  Image.asset('assets/images/icon/ic_star.png',width: 35, height: 35,)
                ],),
              )
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
                          child: TextUI(index.toString().length==1?" "+index.toString():index.toString(),fontSize: 18,color: Colors.white,),
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
                width: 80,
                height: 80,
                margin: EdgeInsets.only(bottom: 60,left: 25),
                src: 'assets/images/icon/ic_back.png',
                onTap: (){
                  _handleBackToMaze();
                },
              ),
            )
          ],
        );
      }
      case Screen.Play:{
        return Stack(
          children: [
            background_screen,
            PlayScreen(),
          ],
        );
      }
      default: return Scaffold();
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
}
