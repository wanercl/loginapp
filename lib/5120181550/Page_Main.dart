import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/Fragment_Acount.dart';
import 'package:loginapp/5120181550/Fragment_Home.dart';
import 'package:loginapp/5120181550/Page_Help.dart';

class Page_Main extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page_MainState();
  }

}

class _Page_MainState extends State<Page_Main>{

  int _currentpage=0;

  final List<Widget> fragments=[Fragment_Home(),Fragment_Acount()];

  void _help(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Help()));
  }

  void _goto(int index){
    if(index!=_currentpage)
    setState(() {
      _currentpage=index;
    });
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
          child: fragments[_currentpage],
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