
import 'package:feedyourpig_flutter/helper/text_ui.dart';
import 'package:flutter/material.dart';

Future<void> showDialogPause(BuildContext context) async{
  return await showDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: 300.0,
              height: 180.0,
              padding: EdgeInsets.only(top:20, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background/dialog_background.png',),
                  )
              ),
              child: Column(children: [
                TextUI('pause !', fontSize: 36, color: Color(0xff6a4a28),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/button/btnstyle.png'),
                            )
                        ),
                        child: Icon(Icons.home_outlined),
                      ),
                      onPressed: () {
                        setState((){
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        height: 80, width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/button/btncirclestyle.png'),
                            )
                        ),
                        child: Icon(Icons.play_arrow),
                      ),
                      onPressed: () {
                        setState((){
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/button/btnstyle.png'),
                            )
                        ),
                        child: Icon(Icons.menu_sharp),
                      ),
                      onPressed: () {
                        setState((){
                        });
                      },
                    ),
                  ],

                )
              ],),
            ),
          );
        },
      );
    },
  );
}