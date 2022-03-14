import 'package:flame_audio/flame_audio.dart';

import '../../database.dart';

class AudioUtils {
  static initialize()async{
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll(['click.mp3','eating.mp3','explosion.mp3','lose.mp3','star1.mp3','star2.mp3','star3.mp3','swipe.mp3','win.m4a']);
  }
  static click(){
    if(db.getSound()){
      FlameAudio.audioCache.play('click.mp3');
    }
  }
  static eating(){
    if(db.getSound()){
      FlameAudio.audioCache.play('eating.mp3');
    }
  }
  static explosion(){
    if(db.getSound()){
      FlameAudio.audioCache.play('explosion.mp3');
    }
  }
  static lose(){
    if(db.getSound()){
      FlameAudio.audioCache.play('lose.mp3');
    }
  }
  static star1(){
    if(db.getSound()){
      FlameAudio.audioCache.play('star1.mp3');
    }
  }
  static star2(){
    if(db.getSound()){
      FlameAudio.audioCache.play('star2.mp3');
    }
  }
  static star3(){
    if(db.getSound()){
      FlameAudio.audioCache.play('star3.mp3');
    }
  }
  static swipe(){
    if(db.getSound()){
      FlameAudio.audioCache.play('swipe.mp3');
    }
  }
  static win(){
    if(db.getSound()){
      FlameAudio.audioCache.play('win.m4a');
    }
  }
  static playMusic(){
    FlameAudio.bgm.play('music.m4a');
  }
  static stopMusic(){
    FlameAudio.bgm.stop();
  }
}