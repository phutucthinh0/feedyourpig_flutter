import 'package:feedyourpig_flutter/constants/system_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerFlexible extends StatelessWidget {
  final Widget? child;
  final BoxDecoration? decoration;
  const ContainerFlexible({this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: decoration,
      constraints: BoxConstraints(
        maxWidth: SystemConstant.maxWidth(),
        maxHeight: SystemConstant.maxHeight(),
      ),
      child: child,
    );
  }
}
