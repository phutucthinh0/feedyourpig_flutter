import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerFlexible extends StatelessWidget {
  final Widget? child;
  final BoxDecoration? decoration;
  const ContainerFlexible({this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: SystemConstant.width,
        height: SystemConstant.height,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
