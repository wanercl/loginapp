import 'package:loginapp/DataBase.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteHelper{
  static Database db=null;
  static User CurrentUser=null;

  SQLiteHelper();
  static void initial() async{
    db= await openDatabase("database.db",version: 1,onCreate: _OnCreate);
  }

  static void _OnCreate(Database database,int v){
    database.execute('''
      CREATE TABLE IF NOT EXISTS 'USERS'(
        'NUMBER' char(11) PRIMARY KEY,
        'NAME' VARCHAR(100),
        'NICKNAME' VARCHAR(100),
        'PASS' VARCHAR(100),
        'LEVEL' NUMBER,
        'SEX' NUMBER,
        'ICON' VARCHAR(100)
      )
    ''');
    database.execute('''
      CREATE TABLE IF NOT EXISTS 'NEWS'(
        'ID' VARCHAR(100) PRIMARY KEY,
        'NUMBER' CHAR(11),
        'CTIME' VARCHAR(100),
        'TITLE' VARCHAR(100),
        'DESCRIPTION' VARCHAR(100),
        'SOURCE' VARCHAR(100),
        'PICURL' VARCHAR(100),
        'URL' VARCHAR(100)
      )
    ''');
  }

  static void _CHECK()async{
    if(db==null){
      await initial();
    }
  }

  static void AddNEWS(News news)async{
    await _CHECK();
    Map<String,dynamic> n=Map();
    n['ID']=news.id;
    n['NUMBER']=CurrentUser.number;
    n['CTIME']=news.ctime;
    n['TITLE']=news.title;
    n['DESCRIPTION']=news.description;
    n['SOURCE']=news.source;
    n['PICURL']=news.picUrl;
    n['URL']=news.url;
    db.insert("NEWS", n);
  }

  static Future<List<News>> GetNews() async {
    await _CHECK();
    List<Map> res=await db.query("NEWS",where: "NUMBER=?",whereArgs: [CurrentUser.number]);
    if(res==null)return null;
    List<News> news=[];
    for (int i=res.length-1;i>=0;i--){
      News ns=News(res[i]['ID'], res[i]['CTIME'], res[i]['TITLE'], res[i]['DESCRIPTION'], res[i]['SOURCE'], res[i]['PICURL'], res[i]['URL']);
      news.add(ns);
    }
    return news;
  }

  static Future<bool> AddUSER(User user)async{
    await _CHECK();
    List<Map> res=await db.query("USERS",where: "NUMBER=?",whereArgs: [user.number]);
    if(res!=null&&res.length>0)
      return false;
    Map<String,dynamic> n=Map();
    n['NUMBER']=user.number;
    n['NAME']=user.name;
    n['NICKNAME']=user.nickname;
    n['PASS']=user.pass;
    n['LEVEL']=user.level;
    n['SEX']=user.sex;
    n['ICON']=user.icon;
    try{
      db.insert("USERS", n);
    }catch(e){
      return false;
    }
    return true;
  }

  static Future<User> CheckUSER(String number,String pass)async{
    await _CHECK();
    List<Map> res=await db.query("USERS");
    if(res==null)return null;
    for (Map n in res){
      if(n['NUMBER']==number&&pass==n['PASS'])
        return User(n['NAME'], n['NICKNAME'], n['NUMBER'], n['PASS'], n['LEVEL'], n['ICON'], n['SEX']);
    }
    return null;
  }

  static void ModifyUSERPASS(String password)async{
    await _CHECK();
    Map<String,dynamic> v=Map();
    v['PASS']=password;
    db.update("USERS", v,where: "NUMBER=?",whereArgs: [CurrentUser.number]);
    CurrentUser.pass=password;
  }

  static void SetCurrentUser(User user){
    CurrentUser =user;
  }
}