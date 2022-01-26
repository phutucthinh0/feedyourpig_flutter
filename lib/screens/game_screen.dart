import 'package:feedyourpig_flutter/screens/play_screen.dart';
import 'package:feedyourpig_flutter/utils/system/ui_util.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    UIUtil.fullscreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: ContainerFlexible(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            Image.asset("assets/images/star1.png", width: 50, height: 50,),
            ElevatedButton(onPressed: ()=>Get.to(()=>PlayScreen()), child: Text('Go to play'))
          ],
        ),
      )
    );
  }
}
