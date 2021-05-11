import 'package:flutter/material.dart';

class Page_Info extends StatelessWidget{

  String title;

  Page_Info(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text('详情页'),
        )
    );
  }

}