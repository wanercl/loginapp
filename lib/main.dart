import 'package:flutter/material.dart';
import 'package:loginapp/DataBase.dart';

import '5120181550/Page_login.dart';

void main() {
  User.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page_login(),
    );
  }
}