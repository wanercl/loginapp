import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Fragments/Fragment_Life.dart';
import 'package:loginapp/5120181550/UI/Views/GridItem_News.dart';
import 'package:loginapp/5120181550/UI/Views/TopListBar.dart';
import 'package:loginapp/5120181550/UI/Views/ListItem_News.dart';
import 'package:loginapp/DataBase.dart';

import 'Fragment_News.dart';

class Fragment_Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_Home();
  }
}

class _State_Home extends State<Fragment_Home>  with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  int currentfragment=0;


  static List<News> news=[];
  static List<ListItem_News> items=[];
  static List<GridItem_News> grids=[];
  static List<Widget> fragments=[Fragment_News(),Fragment_Life()];

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0,keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TopListBar(
          texts: [
            '综合新闻',
            '常识测验'
          ],
          height: 45,
          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          onItemTap: (index){
            _pageController.jumpToPage(index);
          },
          style: TextStyle(
            fontSize: 20
          ),
        ),
        Expanded(
          child: PageView(
            children: fragments,
            controller: _pageController,
          )
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
