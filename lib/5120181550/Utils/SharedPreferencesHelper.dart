import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static void SetLastInfo(String number,String pass,bool flag)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("NUMBER", number);
    preferences.setString("PASS", pass);
    preferences.setBool("FLAG", flag);
  }

  static Future<Map> GetLastInfo()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map map=Map();
    map['NUMBER']=preferences.getString("NUMBER");
    map['PASS']=preferences.getString("PASS");
    map['FLAG']=preferences.getBool("FLAG");
    return map;
  }
}