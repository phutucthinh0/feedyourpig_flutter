import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SystemConstant {
  static double width(){
    if(Get.width >= Get.height){
      if(Get.height*9/19 > Get.width){
        print('-------------------------BUG UI-------------------------');
        print('-----WIDTH:  ${Get.width}-------------------------');
        print('----HEIGHT:  ${Get.height}-------------------------');
        return Get.width;
      }
      return Get.height*9/19;
    }
    return Get.width;
  }
  static double height(){
    if(Get.width < Get.height){
      if(Get.width*19/9 > Get.height){
        print('-------------------------BUG UI-------------------------');
        print('-----WIDTH:  ${Get.width}-------------------------');
        print('----HEIGHT:  ${Get.height}-------------------------');
        return Get.height;
      }
      return Get.width*19/9;
    }
    return Get.height;
  }
}