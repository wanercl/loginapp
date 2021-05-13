import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/DataBase.dart';

class Fragment_Acount extends StatelessWidget{

  User u;

  Fragment_Acount(this.u);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    "images/img_userheader.jpg",
                    height: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(u.nickname),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
          child: Row(
            children: [
              SizedBox(
                width: 85,
                child: Text(
                  '姓名:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  )
                ),
              ),
              Text(
                u.name,
                style: TextStyle(
                  fontSize: 18,
                )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
          child: Row(
            children: [
              SizedBox(
                width: 85,
                child: Text(
                  '性别:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  )
                ),
              ),
              Text(
                u.sex==1?'男':'女',
                style: TextStyle(
                  fontSize: 18,
                )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
          child: Row(
            children: [
              SizedBox(
                width: 85,
                child: Text(
                  '手机号:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  )
                ),
              ),
              Text(
                u.number,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
          child: Row(
            children: [
              SizedBox(
                width: 85,
                child: Text(
                  '账号等级:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                  ),
                ),
              ),
              Text(
                u.level.toString()+'级',
                style: TextStyle(
                  fontSize: 18,
                )
              )
            ],
          ),
        ),
      ],
    );
  }

}