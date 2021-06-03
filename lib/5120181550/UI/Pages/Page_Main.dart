import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Fragments/Fragment_Acount.dart';
import 'package:loginapp/5120181550/UI/Fragments/Fragment_Home.dart';
import 'package:loginapp/5120181550/Utils/SQLiteHelper.dart';
import 'package:loginapp/DataBase.dart';

import 'Page_Help.dart';

class Page_Main extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page_MainState();
  }

}

class _Page_MainState extends State<Page_Main>{

  int _currentpage=0;

  PageController _controller=PageController(initialPage: 0,keepPage: true);

  List<Widget> fragments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fragments=[Fragment_Home(),Fragment_Acount(SQLiteHelper.CurrentUser)];
  }

  void _help(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Help()));
  }

  void _goto(int index){
    if(index!=_currentpage)
    _currentpage=index;
    _controller.jumpToPage(_currentpage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('斯沃思特浏览器'),
              IconButton(icon: Icon(Icons.help_outline), onPressed: _help)
            ],
          ),
        ),
        body: PageView(
          controller: _controller,
          children: fragments,
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '主页',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
            label: '个人'
          )
        ],
        currentIndex: _currentpage,
        onTap: (index){
          _goto(index);
        },
      ),
    );
  }

}