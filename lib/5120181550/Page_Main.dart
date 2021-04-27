import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/Page_Help.dart';

class Page_Main extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page_MainState();
  }

}

class _Page_MainState extends State<Page_Main>{

  void _help(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Help()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('浏览器'),
              IconButton(icon: Icon(Icons.help_outline), onPressed: _help)
            ],
          ),
        ),
        body: Center(
          child: Text('主页'),
        )
    );
  }

}