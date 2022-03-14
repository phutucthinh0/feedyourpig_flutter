import 'package:shared_preferences/shared_preferences.dart';

class DB {
  DB();
  late SharedPreferences prefs;
  void initialize()async{
    prefs = await SharedPreferences.getInstance();
  }
  Future<void> setMusic(bool val)async{
    await prefs.setBool('music', val);
  }
  bool getMusic(){
    return prefs.getBool('music') ?? true;
  }

  Future<void> setSound(bool val)async{
    await prefs.setBool('sound', val);
  }
  bool getSound(){
    return prefs.getBool('sound') ?? true;
  }

  Future<void> setPigCharacter(int val)async{
    await prefs.setInt('pig', val);
  }
  int getPigCharacter(){
    return prefs.getInt('pig') ?? 0;
  }
  Future<void> setCandySkin(int val)async{
    await prefs.setInt('candy', val);
  }
  int getCandySkin(){
    return prefs.getInt('candy') ?? 0;
  }
}
DB db = DB();