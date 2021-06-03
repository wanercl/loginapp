import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Pages/Page_Modify.dart';
import 'package:loginapp/DataBase.dart';

class Fragment_Acount extends StatefulWidget{

  User u;

  Fragment_Acount(this.u);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_Acount();
  }

}

class _State_Acount extends State<Fragment_Acount> with AutomaticKeepAliveClientMixin{

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
                  child: Text(widget.u.nickname),
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
                  widget.u.name,
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
                  widget.u.sex==1?'男':'女',
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
                widget.u.number,
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
                  widget.u.level.toString()+'级',
                  style: TextStyle(
                    fontSize: 18,
                  )
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
          child: InkWell(
            child: Text(
              '修改密码',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>Page_Modify()));
            } ,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}