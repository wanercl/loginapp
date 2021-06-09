import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/5120181550/Utils/SQLiteHelper.dart';
import 'package:loginapp/5120181550/Utils/SharedPreferencesHelper.dart';
import 'package:loginapp/DataBase.dart';

import 'Page_Main.dart';
import 'Page_SignUp.dart';

class Page_login extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageloginState();
  }

}

class _PageloginState extends State<Page_login>{
  bool showpass=false;
  TextEditingController number=TextEditingController();
  TextEditingController pass=TextEditingController();
  void _login() async{
    User u= await SQLiteHelper.CheckUSER(number.value.text,pass.value.text);
    if(u!=null){
      if(_issave)
        SharedPreferencesHelper.SetLastInfo(number.value.text, pass.value.text,true);
      else
        SharedPreferencesHelper.SetLastInfo('', '',false);
      SQLiteHelper.SetCurrentUser(u);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Main()));
    }
    else
      Fluttertoast.showToast(msg: '手机号或密码错误');
  }

  Map info=null;
  bool _issave=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ()async{
      info=await SharedPreferencesHelper.GetLastInfo();
      number.text=info['NUMBER'];
      pass.text=info['PASS'];
      _issave=info['FLAG'];
      setState(() {
      });
    }();
  }

  void dismiss(){
    setState(() {
      showpass=!showpass;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page_Login'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15
        ),
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 80,
                child: TextField(
                  controller: number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      hintText: '请输入手机号码',
                      helperText: '您注册时的电话号码',
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                  autofocus: false,
                ),
              ),
              SizedBox(
                height: 80,
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: '请输入密码',
                      helperText: '您设置的登陆密码',
                      suffix: IconButton(onPressed: dismiss, icon: Icon(showpass? Icons.visibility_outlined:Icons.visibility_off_outlined)),
                      border: OutlineInputBorder()
                  ),
                  obscureText: !showpass,
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: false,
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 5),
                      child: Row(
                        children: [
                          Icon(_issave?Icons.check_box_outlined:Icons.check_box_outline_blank_outlined),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              '记住密码',
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      _issave=!_issave;
                      setState(() {
                      });
                    },
                  )
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('登录',),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _login)
              ),
              SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                      child: Text('注册',),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_SignUp()));
                      })
              ),
            ],
          ),
        ),
      )
    );
  }

}
