import 'package:feedyourpig_flutter/utils/system/ui_util.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UIUtil.fullscreen();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          elevation: 0,
          child: Image.asset('assets/images/icon/ic_back.png'),
          backgroundColor: Colors.transparent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: ContainerFlexible(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/background.png'),
                fit: BoxFit.fill,
              )
          ),
          child: Stack(
            children: [
              Container(
              ),
              const TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text("It's cloudy here"),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
