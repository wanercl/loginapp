import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/Page_Main.dart';

class Page_login extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageloginState();
  }

}

class _PageloginState extends State<Page_login>{
  bool showpass=false;
  void _login(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Main()));
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
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: TextField(
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
                child: RaisedButton(
                  child: Text('登录',),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _login)
              ),
            ],
          ),
        ),
      )
    );
  }

}
