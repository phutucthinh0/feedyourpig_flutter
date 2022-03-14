
import 'package:feedyourpig_flutter/helper/button_ui.dart';
import 'package:feedyourpig_flutter/screens/gallery_screen.dart';
import 'package:feedyourpig_flutter/screens/game_screen.dart';
import 'package:feedyourpig_flutter/utils/system/audio_utils.dart';
import 'package:feedyourpig_flutter/utils/system/ui_util.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:feedyourpig_flutter/widgets/dialogs/dialog_close_game.dart';
import 'package:feedyourpig_flutter/widgets/dialogs/dialog_setting.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _animBlack = false;
  _handleBlackScreen([int duration = 400]){
    setState(() {
      _animBlack = true;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // full screen background
    UIUtil.fullscreen();
    //Coach mark
    if(db.getMusic()){
      AudioUtils.playMusic();
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  () async => showDialogCloseApp(context),
      child: Scaffold(
        body: ContainerFlexible(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/background_main.png'),
              fit: BoxFit.fill,
            )
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                child: buttonUI(width: 300, height: 60,
                  text: "Play",
                  fontSize: 48,
                  src: 'assets/images/button/btnstylenext.png',
                  margin: EdgeInsets.only(bottom: 40),
                  onTap: (){
                    AudioUtils.click();
                    Get.to(()=>GameScreen(),transition: Transition.rightToLeftWithFade , duration: Duration(milliseconds: 500));
                  },
                ),
              ),
              Align(
                child: buttonUI(width: 300, height: 60,
                  text: "Gallery",
                  fontSize: 36,
                  src: 'assets/images/button/btnstylenext.png',
                  margin: EdgeInsets.only(top: 140),
                  onTap:(){
                    AudioUtils.click();
                    Get.to(()=>GalleryScreen(),transition: Transition.rightToLeftWithFade , duration: Duration(milliseconds: 500));
                  },
                ),
              ),
              Align(
                child: buttonUI(width: 300, height: 60,
                  fontSize: 36,
                  text: "Setting",
                  src: 'assets/images/button/btnstylenext.png',
                  margin: EdgeInsets.only(top:320),
                  onTap: (){
                    AudioUtils.click();
                    showDialogSetting(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
