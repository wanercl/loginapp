import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/5120181550/Utils/SQLiteHelper.dart';

class Page_Modify extends StatelessWidget{

  TextEditingController pass=TextEditingController();
  TextEditingController pass_=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('修改密码'),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20,top: 10,right: 20),
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 80,
                  child: TextField(
                    controller: pass,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: '请输入新密码',
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
                        hintText: '请再次确认密码',
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
                        child: Text('确认修改',),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: (){
                          _modify(context);
                        })
                ),
              ],
            )
          ),
        )
    );
  }

  void _modify(BuildContext context)async{
    if(pass.value.text!=pass_.value.text){
      Fluttertoast.showToast(msg: '两次密码不一致');
      return;
    }
    SQLiteHelper.ModifyUSERPASS(pass.value.text);
    Fluttertoast.showToast(msg: '修改成功');
    Navigator.pop(context);
  }
}