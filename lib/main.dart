import 'package:feedyourpig_flutter/helper/custom_behavior.dart';
import 'package:feedyourpig_flutter/screens/home_screen.dart';
import 'package:feedyourpig_flutter/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feed Your Pig',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        fontFamily: 'Nolan'
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      home: SplashScreen(),
    );
  }
}
