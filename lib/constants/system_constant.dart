import 'package:get/get.dart';

class SystemConstant {
  static double maxWidth(){
    if(GetPlatform.isMobile){
      return Get.width;
    }
    return 720;
  }
  static double maxHeight(){
    if(GetPlatform.isMobile){
      return Get.height;
    }
    return 1080;
  }
}