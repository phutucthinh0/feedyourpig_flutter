import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Net extends Component {
  bool visible = false;
  final Paint _paintLine = Paint()
      ..color = Color(0x33000000)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
  // Net() : super(priority: 0) {
  //
  // }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for(int i = 0; i<=19; i++){
      canvas.drawLine(
          Offset(SystemConstant.spaceWidth,SystemConstant.spaceHeight+i*SystemConstant.unitSize),
          Offset(SystemConstant.width-5,SystemConstant.spaceHeight+i*SystemConstant.unitSize),
          _paintLine);
    }
    for(int i = 0; i<=11; i++){
      canvas.drawLine(
          Offset(SystemConstant.spaceWidth+i*SystemConstant.unitSize,SystemConstant.spaceHeight),
          Offset(SystemConstant.spaceWidth + i * SystemConstant.unitSize, SystemConstant.spaceHeight + SystemConstant.unitSize * 19),
          _paintLine);
    }

  }
}