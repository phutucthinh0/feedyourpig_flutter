import 'package:feedyourpig_flutter/helper/button_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ABC")),
      body: Stack(
        children: [
          Image.asset('assets/background_main'),
        ],
      ),
    );
  }
}
