import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Views/ListItem_News.dart';
import 'package:loginapp/5120181550/Utils/SQLiteHelper.dart';
import 'package:loginapp/DataBase.dart';

class Fragment_History extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_History();
  }

}

class _State_History extends State<Fragment_History>{
  List<News> news=null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ()async{
      news =await SQLiteHelper.GetNews();
      setState(() {
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    if(news==null){
      return Center(
        child: Text(
          '加载中...'
        ),
      );
    }else if(news.length<=0){
      return Center(
        child: Text(
            '没有历史记录'
        ),
      );
    }
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context,index){
        return ListItem_News(news[index]);
      });
  }
}