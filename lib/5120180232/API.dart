import 'dart:convert';
import 'package:http/http.dart';

import 'package:loginapp/DataBase.dart';

class API{

  static final String URL="http://api.tianapi.com/generalnews/index?key=529d2f6c2704d56b1e4d1b6561aa0070&rand=1";

  static Future<List<News>> GetNews() async{
    Map data;
    List<News> news=[];
    try {
      Response response = await get(URL);
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
}