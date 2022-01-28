
import 'package:flutter/material.dart';

class buttonUI extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final EdgeInsets margin;
  final onTap;
  final String src;

  buttonUI({this.width = double.infinity,this.fontFamily = "Nolan" , this.height = double.infinity,this.text="", this.fontSize=28, this.fontWeight = FontWeight.normal, this.textColor = Colors.white, required this.onTap, this.margin= EdgeInsets.zero, this.src='', });
  @override
  _buttonUI createState() => _buttonUI();
}

class _buttonUI extends State<buttonUI> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap();
      },
      onTapDown: (a){
        setState(() {
          enable=true;
        });
      },
      onTapUp: (a){
        setState(() {
          enable=false;
        });
      },
      onTapCancel: (){
        setState(() {
          enable=false;
        });
      },
      child: Opacity(
        opacity: enable?0.5:1,
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.src),fit: BoxFit.fill),
          ),
          child: Center(child: Text(widget.text,style: TextStyle(fontSize: widget.fontSize,fontWeight: widget.fontWeight,color: widget.textColor,fontFamily: 'Nolan'))),
        ),
      ),
    );
  }
}




