
import 'package:feedyourpig_flutter/helper/button_ui.dart';
import 'package:feedyourpig_flutter/values/candy.dart';
import 'package:feedyourpig_flutter/values/pig.dart';
import 'package:feedyourpig_flutter/widgets/container_flexible.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../database.dart';



class GalleryScreen extends StatefulWidget {
  final int index;
  const GalleryScreen({Key? key, this.index = 0}) : super(key: key);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late PageController controller;
  AssetImage _candyCharacter = AssetImage(CandyCode.type0);
  _handleSelectedCandy(int typeCandy){
    db.setCandySkin(typeCandy);
    setState(() {
      _candyCharacter = AssetImage(CandyCode.listCandy()[typeCandy]);
    });
  }
  AssetImage _pigCharacter = AssetImage(PigCode.type0);
  _handleSelectedPig(int typePig){
    db.setPigCharacter(typePig);
    setState(() {
      _pigCharacter = AssetImage(PigCode.listPig()[typePig]);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: widget.index);
  }
  @override
  Widget build(BuildContext context) {
    return ContainerFlexible(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background/background.png'), fit: BoxFit.fill,)),
      child: Stack(
        children: [
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 150),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: ScrollingDotsEffect(
                      maxVisibleDots: 5,
                      dotColor: Colors.white,
                      activeDotColor: Colors.red,

                    ),
                  )
              )),
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children:  <Widget>[
              Stack(
                children: [
                  Positioned(
                    top: 40, left: 30, right: 20,
                    child: Image(width: 100,height: 100,image:_pigCharacter),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: buttonUI(width: 40, height: 40,
                        fontSize: 48,
                        src: 'assets/images/icon/ic_arrow_right.png',
                        margin: EdgeInsets.only(top: 100, right: 40),
                        onTap: (){controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate,);}
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 50),
                        itemCount: PigCode.listPig().length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: (){
                              _handleSelectedPig(index);
                            },
                            child: Container(
                                width: 100, height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(PigCode.listPig()[index]))
                                )
                            ),
                          );
                        }),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    top: 40, left: 30, right: 20,
                    child: Image(width: 100,height: 100,image:_candyCharacter),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: buttonUI(width: 40, height: 40,
                        fontSize: 48,
                        src: 'assets/images/icon/ic_arrow_left.png',
                        margin: EdgeInsets.only(top: 100, right: 40),
                        onTap: (){controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate,);}
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 110,
                            childAspectRatio: 3/ 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 50),

                        itemCount: CandyCode.listCandy().length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: (){
                              _handleSelectedCandy(index);
                            },
                            child: Container(
                                width: 100, height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(CandyCode.listCandy()[index]))
                                )
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: buttonUI(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(bottom: 40,left: 20),
              src: 'assets/images/icon/ic_back.png',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}