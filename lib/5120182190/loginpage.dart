
import 'package:flutter/material.dart';
import 'package:loginapp/5120182190/loginmain.dart';

class loginmain extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginmain();
  }

}

class _loginmain extends State<loginmain>{
  bool showpass=false;
  void _login(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>loginmain()));
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
              left:20,
              right: 20,
              top: 20
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 85,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        hintText: '请输入手机号',
                        helperText: '注册的手机号',
                        border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 85,
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
                        child: Text('一键登录',),
                        textColor: Colors.yellow,
                        color: Colors.purple,
                        onPressed: _login)
                ),
              ],
            ),
          ),
        )
    );
  }

}