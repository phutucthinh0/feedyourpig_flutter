import 'package:get/get.dart';

class SystemConstant {
  static late double width;
  static late double height;
  static late double unitSize;
  static late double spaceWidth;
  static late double spaceHeight;

  static void initialize(){
    width = _width();
    height = _height();
    unitSize = _unitSize();
    spaceWidth = _spaceWidth();
    spaceHeight = _spaceHeight();
  }
  static double _width(){
    if(Get.width >= Get.height){
      if(Get.height*9/19 > Get.width){
        print('-------------------------BUG UI-------------------------');
        print('-----WIDTH:  ${Get.width}---------------------------');
        print('----HEIGHT:  ${Get.height}--------------------------');
        return Get.width;
      }
      return Get.height*9/19;
    }
    return Get.width;
  }
  static double _height(){
    if(Get.width < Get.height){
      if(Get.width*19/9 > Get.height){
        print('-------------------------BUG UI-------------------------');
        print('-----WIDTH:  ${Get.width}---------------------------');
        print('----HEIGHT:  ${Get.height}--------------------------');
        return Get.height;
      }
      return Get.width*19/9;
    }
    return Get.height;
  }
  static double _unitSize(){
    return (_width()-10)/11;
  }
  static double _spaceWidth(){
    return 5;
  }
  static double _spaceHeight(){
    return _height() - _unitSize()*19 -20;
  }
}