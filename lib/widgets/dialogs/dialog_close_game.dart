
import 'package:feedyourpig_flutter/helper/text_ui.dart';
import 'package:flutter/material.dart';



Future<bool> showDialogCloseApp(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300.0,
        height: 300.0,
        padding: EdgeInsets.only(top:80, left: 20, right: 20, bottom: 40),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/dialog_background.png'),
            )
        ),
        child: Column(
          children: [
            Center(child: TextUI('Are you sure !', fontSize: 36,color: Color(0xff6a4a28),),),
            SizedBox(height: 20,),
            Center(child: TextUI('Do you want to exit Game ?', fontSize: 24,color: Color(0xff6a4a28),),),
            Spacer(),
            Row(children: [
              Spacer(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child:  TextUI('No', fontSize: 36, color: Colors.cyan,),
              ),
              SizedBox(width: 20,),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child:  TextUI('Yes', fontSize: 36,color: Colors.cyan),
              ),
            ],)
          ],
        ),
      ),
    ),
  )) ?? false;
}