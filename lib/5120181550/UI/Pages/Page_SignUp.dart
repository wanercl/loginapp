import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/5120181550/Utils/SQLiteHelper.dart';
import 'package:loginapp/DataBase.dart';

class Page_SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pase_SignUpState();
  }
}

class _Pase_SignUpState extends State<Page_SignUp>{
  TextEditingController number=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController pass_=TextEditingController();
  int sex=1;

  void _signup()async{
    if(pass.value.text!=pass_.value.text){
      Fluttertoast.showToast(msg: '两次密码不一致');
      return;
    }
    if(await SQLiteHelper.AddUSER(User(name.value.text, name.value.text, number.value.text, pass.value.text, 1, null, sex))){
      Navigator.pop(context);
      Fluttertoast.showToast(msg: '注册成功');
      return;
    }
    Fluttertoast.showToast(msg: '注册失败,手机号码已注册');
    
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
                    controller: name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        hintText: '请输入姓名',
                        helperText: '您的姓名',
                        border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.text,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    children: [
                      Text('性别: '),
                      InkWell(
                        child: Icon(
                          sex==1?Icons.check_circle_outline_rounded:Icons.radio_button_unchecked,
                          color: sex==1?Colors.blue:null,
                        ),
                        onTap: (){
                          sex=1;
                          setState(() {
                          });
                        },
                      ),
                      Text(' 男 '),
                      InkWell(
                        child: Icon(
                          sex==0?Icons.check_circle_outline_rounded:Icons.radio_button_unchecked,
                          color: sex==0?Colors.blue:null,
                        ),
                        onTap: (){
                          sex=0;
                          setState(() {
                          });
                        },
                      ),
                      Text(' 女 '),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: TextField(
                    controller: number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        hintText: '请输入手机号码',
                        helperText: '注册用的电话号码',
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
                        helperText: '设置您的登陆密码',
                        border: OutlineInputBorder()
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: TextField(
                    controller: pass_,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: '请再次输入密码',
                        helperText: '确认您的登陆密码',
                        border: OutlineInputBorder()
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                        child: Text('注册',),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: _signup)
                ),
              ],
            ),
          ),
        )
    );
  }
}