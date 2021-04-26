import 'package:flutter/material.dart';

class Page_login extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageloginState();
  }

}

class _PageloginState extends State<Page_login>{

  void _login(){
    //login
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page_Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: '请输入手机号码'
              ),
              keyboardType: TextInputType.number,
              autofocus: false,
            ),
            TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.add_to_home_screen),
                  labelText: '请输入密码'
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              autofocus: false,
            ),
            RaisedButton(
              child: Text('登录',),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: _login),
          ],
        ),
      ),
    );
  }

}
