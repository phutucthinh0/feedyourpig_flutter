
import 'package:flutter/material.dart';

Future<void> showDialogWin(BuildContext context) async {
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
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/background/dialog_background.png',
                ),
              )),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/icon/ic_star.png', height: 40, width: 40,),
                    Image.asset('assets/images/icon/ic_star.png', height: 40, width: 40,),
                    Image.asset('assets/images/icon/ic_star.png', height: 40, width: 40,)
                  ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/button/btnstyle.png'),
                          )),
                          child: Icon(Icons.home_outlined),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/button/btncirclestyle.png'),
                          )),
                          child: Icon(Icons.menu),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/button/btnstyle.png'),
                          )),
                          child: Icon(Icons.arrow_back),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/button/btnstylenext.png'),
                          )),
                      child: Icon(Icons.skip_next_outlined),
                    ),
                    onPressed: () {
                      setState(() {});
                    },
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
