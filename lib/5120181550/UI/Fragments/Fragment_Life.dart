import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/API.dart';
import 'package:loginapp/DataBase.dart';

class Fragment_Life extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_Life();
  }

}

class _State_Life extends State<Fragment_Life>{

  Life life;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //life=API.GetLife().asStream().;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child:
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10,top: 20,right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      life.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10,top: 20,right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text('正确'),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10,top: 20,right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text('错误'),
                  )
              )
            ],
          )
        ),
        SizedBox(
          height: 30,
          width: double.infinity,
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Center(
                child: Text(
                  '我知道了，下一个',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
            onTap: onTap,
          ),
        )
      ],
    );
  }

  void onTap() async{
    life=await API.GetLife();
    setState(() {
    });
  }

}