import 'package:flutter/material.dart';
import 'package:loginapp/5120180232/loginmain.dart';

class loginpage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageloginState();
  }

}

class _PageloginState extends State<loginpage>{
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
          title: Text('loginpage'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: 200,
              right: 200,
              top: 300
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Mobile phone number',
                        helperText: 'Mobile phone number at the time of registration',
                        border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'password',
                        helperText: 'Your password',
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
                        child: Text('login',),
                        textColor: Colors.black,
                        color: Colors.greenAccent,
                        onPressed: _login)
                ),
              ],
            ),
          ),
        )
    );
  }
}

//用户注册
Align buildRegisterText(BuildContext context){
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.only(top:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('No account?'),
          GestureDetector(
            child: Text(
              'Click on the register',
              style: TextStyle(color: Colors.greenAccent),
            ),
            onTap: (){
              _toRegisterPage(context);//跳转注册页面方法
            },
          ),
        ],
      ),
    ),
  );
}

_toRegisterPage(BuildContext context) async{
  final
}



