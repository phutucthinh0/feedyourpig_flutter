import 'dart:async';

import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:feedyourpig_flutter/helper/text_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    SystemConstant.initialize();
    Timer(Duration(seconds: 5), ()=>Get.off(()=>HomeScreen()),);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffd27361),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/pigs/pig0_stand1.png',
              width: 140,
            ),
            TextUI('Feed Your Pig !',fontSize: 36,color: Colors.white,),
            // SizedBox(height: 300,),
            Spacer(),
            CircularProgressIndicator(color: Colors.white,),
            SizedBox(height: 20,),
            TextUI('Loading data ... ',fontSize: 24,color: Colors.white,),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
