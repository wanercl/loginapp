import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:loginapp/DataBase.dart';

class API{

  static final String REQUESTURL="http://api.tianapi.com/generalnews/index";
  static final String APIKEY="f492bfe5b56b7433614b747e0681a665";
  static final String LIFEURL="http://api.tianapi.com/txapi/decide/index";

  static Future<List<News>> GetNews({int num=15,int rand=0,String word=null}) async{
    print('requestapi');
    Map data;
    String url=REQUESTURL
        +"?key="+APIKEY
        +'&rand='+rand.toString()
        +'&num='+num.toString();
    word!=null? url+='&word='+word:url=url;
    List<News> news=[];
    try {
      Response response = await get(url);
      data=jsonDecode(response.body);
      if(response.statusCode!=200)
        return null;
      List list=data['newslist'];
      for(Map n in list){
        news.add(News(n['id'], n['ctime'], n['title'], n['description'], n['source'], n['picUrl'], n['url']));
      }
    }on Exception catch(error){
      print(error);
      return null;
    }
    return news;
  }

  static Future<Life> GetLife() async{
    print('requestapi');
    Map data;
    String url=LIFEURL
        +"?key="+APIKEY;
    Life life=null;
    try {
      Response response = await get(url);
      data=jsonDecode(response.body);
      if(response.statusCode!=200)
        return null;
      List list=data['newslist'];
      print(list);
      Map n = list[0];
      life=Life(n['title'],n['answer'],n['analyse']);
    }on Exception catch(error){
      print(error);
      return null;
    }
    return life;
  }

}