import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page_Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Page_Main'),
        ),
        body: Center(
          child: Text('主页'),
        )
    );
  }

}