import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page_Help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('帮助'),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20,top: 10,right: 20),
          child: Container(
            child: Text('        使用说明:\n\n        主界面下方控制页面清单\n\n        主页为新闻浏览页面,界面上方可选择新闻浏览布局为列表或瀑布流布局,点按新闻后将进入新闻详情页面。\n\n        个人为账号信息展示。'),
          ),
        )
    );
  }

}