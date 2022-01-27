

import 'package:feedyourpig_flutter/helper/button_ui.dart';
import 'package:feedyourpig_flutter/screens/gallery_screen.dart';
import 'package:feedyourpig_flutter/screens/game_screen.dart';
import 'package:feedyourpig_flutter/utils/system/ui_util.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:feedyourpig_flutter/widgets/dialogs/dialog_close_game.dart';
import 'package:feedyourpig_flutter/widgets/dialogs/dialog_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // full screen background
    UIUtil.fullscreen();
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
                child: ButtonUI(width: 300, height: 60,
                  text: "Play",
                  fontSize: 48,
                  margin: EdgeInsets.only(bottom: 40),
                  onTap: ()=>Get.to(()=>GameScreen()),
                ),
              ),
              Align(
                child: ButtonUI(width: 300, height: 60,
                  text: "Gallery",
                  fontSize: 36,
                  margin: EdgeInsets.only(top: 140),
                  onTap:()=>Get.to(()=>GalleryScreen()),
                ),
              ),
              Align(
                child: ButtonUI(width: 300, height: 60,
                  fontSize: 36,
                  text: "Setting",
                  margin: EdgeInsets.only(top:320),
                  onTap: (){
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
