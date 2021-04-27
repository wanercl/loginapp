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

  static bool check(String numder,String pass){
    for(User user in users){
      if(user.number==numder&&user.pass==pass)
        return true;
    }
    return false;
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
    users.add(User('邹存玉', '万年老二','19960209351', '123456', 1, null, 0));
    users.add(User('杨璇', '万年老二','19960209352', '123456', 1, null, 0));
  }
}