import 'package:feedyourpig_flutter/controllers/game_controller.dart';
import 'package:feedyourpig_flutter/flame/main_game.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/button_ui.dart';

class PlayScreen extends StatefulWidget {

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final mainGame = MainGame();
  GameController gameController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ContainerFlexible(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/background/bg_ice.png"),
      //     fit: BoxFit.cover
      //   )
      // ),
      child: Stack(
        children: [
          GameWidget(
            game: mainGame,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: buttonUI(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 10, left:  25),
              src: 'assets/images/icon/ic_help.png',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: buttonUI(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 10, right:  10),
              src: 'assets/images/icon/ic_pause.png',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: buttonUI(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 10, right:  60),
              src: 'assets/images/icon/ic_back2.png',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    starWidget(gameController.lightStar.value >= 1),
                    starWidget(gameController.lightStar.value >= 2),
                    starWidget(gameController.lightStar.value >= 3)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget starWidget(bool b) => b?Image.asset('assets/images/icon/ic_star.png', height: 40, width: 40,)
      :Image.asset('assets/images/icon/ic_star_lose.png', height: 40, width: 40,);
}
