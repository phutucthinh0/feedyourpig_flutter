import 'package:flutter/services.dart';

class UIUtil {
  static void fullscreen([bool state = true]){
    if(state){
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }else{
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    }
  }
}