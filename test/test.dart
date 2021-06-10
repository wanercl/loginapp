import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:loginapp/5120181550/API.dart';
import 'package:loginapp/DataBase.dart';

void main(){
  test('API_NEWS', () async {
    await APITEST();
  });
  test('API_LIFE', () async {
    await SELTEST();
  });
}

void APITEST()async{
  List news=await API.GetNews();
  expect(news.length, 15);
  expect(news[0].runtimeType,News);
}

void SELTEST()async{
  var life=await API.GetLife();
  expect(life.runtimeType,Life);
}