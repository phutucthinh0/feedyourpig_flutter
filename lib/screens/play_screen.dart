import 'package:feedyourpig_flutter/flame/main_game.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final mainGame = MainGame();
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
        ],
      ),
    );
  }
}
