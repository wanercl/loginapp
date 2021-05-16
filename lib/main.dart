import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Pages/Page_login.dart';
import 'package:loginapp/5120181550/UI/Views/DropFreshView.dart';
import 'package:loginapp/DataBase.dart';


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
        primarySwatch: Colors.blue,
      ),
      home: Page_login()
    );
  }
}