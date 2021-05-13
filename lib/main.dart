import 'package:flutter/material.dart';
import 'package:loginapp/5120182190/loginpage.dart';
import 'package:loginapp/DataBase.dart';

import 'loginapp/5120182190/loginmain.dart';

void main() {
  User.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '欢迎登陆',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: loginmain(),
    );
  }
}