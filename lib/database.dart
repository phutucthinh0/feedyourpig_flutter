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
}
DB db = DB();