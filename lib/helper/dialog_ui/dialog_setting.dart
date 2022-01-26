
import 'package:flutter/material.dart';

import '../text_ui.dart';

Future<void> showDialogSetting(BuildContext context) async{
  bool isMusicOn = true;
  bool isSoundOn = true;
  bool isVibrationOn = true;
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
              height: 300.0,
              padding: EdgeInsets.only(top:80, left: 20, right: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/dialog_background.png'),
                  )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextUI('Music',fontSize: 48,color: Color(0xff6a4a28),),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/btnstyle.png'),
                              )
                          ),
                          child: Icon((isMusicOn== false) ?Icons.music_note_outlined : Icons.music_off_outlined),
                        ),
                        onPressed: () {
                          setState((){
                            isMusicOn = !isMusicOn;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextUI('Sound',fontSize: 48,color: Color(0xff6a4a28),),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/btnstyle.png'),
                              )
                          ),
                          child: Icon((isSoundOn== false) ?Icons.volume_up : Icons.volume_off),
                        ),
                        onPressed: () {
                          setState((){
                            isSoundOn = !isSoundOn;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextUI('Vibration',fontSize: 48,color: Color(0xff6a4a28),),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/btnstyle.png'),
                              )
                          ),
                          child: Icon((isVibrationOn== false) ?Icons.blur_on_outlined : Icons.blur_off_outlined),
                        ),
                        onPressed: () {
                          setState((){
                            isVibrationOn = !isVibrationOn;
                          });
                        },
                      )

                    ],
                  )
                ],

              ),
            ),
          );
        },
      );
    },
  );
}