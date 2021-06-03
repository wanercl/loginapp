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