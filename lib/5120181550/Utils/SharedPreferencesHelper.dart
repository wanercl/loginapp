import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static void SetLastInfo(String number,String pass)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("NUMBER", number);
    preferences.setString("PASS", pass);
  }

  static Future<Map> GetLastInfo()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map map=Map();
    map['NUMBER']=preferences.getString("NUMBER");
    map['PASS']=preferences.getString("PASS");
    return map;
  }
}