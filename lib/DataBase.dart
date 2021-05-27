import 'dart:typed_data';

class User{
  String name;
  String number;
  String pass;
  String nickname;
  ByteBuffer icon;
  int level=1;
  int sex=0;
  User(
      this.name,
      this.nickname,
      this.number,
      this.pass,
      this.level,
      this.icon,
      this.sex
      );

  static List users=List();

  static User check(String numder,String pass){
    for(User user in users){
      if(user.number==numder&&user.pass==pass)
        return user;
    }
    return null;
  }

  static bool adduser(User user){
    for(User u in users){
      if(u.number==user.number)
        return false;
    }
    users.add(user);
    return true;
  }

  static void init(){
    users.add(User('陈龙', '万年老二','19960209350', '123456', 1, null, 1));
    users.add(User('邹存玉', '万年老二','15508060186', '123456', 1, null, 0));
    users.add(User('杨璇', '万年老二','13208285009', '999999', 1, null, 0));
  }
}

class News{
  String id;
  String ctime;
  String title;
  String description;
  String source;
  String picUrl;
  String url;
  News(
    this.id,
    this.ctime,
    this.title,
    this.description,
    this.source,
    this.picUrl,
    this.url
  );
}

class Life{
  String title;
  int answer;
  String analyse;
  Life(
    this.title,
    this.answer,
    this.analyse
  );
}