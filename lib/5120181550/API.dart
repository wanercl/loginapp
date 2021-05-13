import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:loginapp/DataBase.dart';

class API{

  static final String REQUESTURL="http://api.tianapi.com/generalnews/index";
  static final String APIKEY="f492bfe5b56b7433614b747e0681a665";

  static Future<List<News>> GetNews([int num=15,int rand=0,String word=null]) async{
    print('requestapi');
    Map data;
    String url=REQUESTURL
        +"?key="+APIKEY
        +'&rand='+rand.toString()
        +'&num='+num.toString();
    word!=null? url+='&word='+word:url=url;
    print(url);
    Response response=await get(url);
    data=jsonDecode(response.body);
    if(response.statusCode!=200)
      return [];
    List list=data['newslist'];
    List<News> news=[];
    for(Map n in list){
      news.add(News(n['id'], n['ctime'], n['title'], n['description'], n['source'], n['picUrl'], n['url']));
    }
    return news;
  }
}