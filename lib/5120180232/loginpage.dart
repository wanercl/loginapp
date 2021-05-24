import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  String userName;
  String password;
  bool isShowPassWord = false;

  void login(){
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if(loginForm.validate()){
      loginForm.save();
      print('userName: ' + userName + ' password: ' + password);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return SecondScreen();}));
  }

  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'LOGIN Demo',
      home: new Scaffold(
        body: new Column(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(top: 100.0, bottom: 10.0),
                child: new Text(
                  'Welcome',
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 53, 53),
                      fontSize: 50.0
                  ),
                )
            ),
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                autovalidate: true,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0
                              )
                          )
                      ),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.phone_android_outlined),
                          labelText: '请输入手机号',
                          labelStyle: new TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                          border: InputBorder.none,
                          // suffixIcon: new IconButton(
                          //   icon: new Icon(
                          //     Icons.close,
                          //     color: Color.fromARGB(255, 126, 126, 126),
                          //   ),
                          //   onPressed: () {

                          //   },
                          // ),
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          userName = value;
                        },
                        validator: (phone) {
                          // if(phone.length == 0){
                          //   return '请输入手机号';
                          // }
                        },
                        onFieldSubmitted: (value) {

                        },
                      ),
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0
                              )
                          )
                      ),
                      child: new TextFormField(
                        decoration:  new InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: '请输入密码',
                            labelStyle: new TextStyle( fontSize: 15.0, color: Color.fromARGB(255, 93, 93, 93)),
                            border: InputBorder.none,
                            suffixIcon: new IconButton(
                              icon: new Icon(
                                isShowPassWord ? Icons.visibility : Icons.visibility_off,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              onPressed: showPassWord,
                            )
                        ),
                        obscureText: !isShowPassWord,
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                    new Container(
                      height: 45.0,
                      margin: EdgeInsets.only(top: 40.0),
                      child: new SizedBox.expand(
                        child: new RaisedButton(
                          onPressed: login,
                          color: Color.fromARGB(255, 61, 203, 128),
                          child: new Text(
                            '登录',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          ),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(45.0)),
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 30.0),
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            child:  Text(
                              '注册账号',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Color.fromARGB(255, 53, 53, 53)
                              ),
                            ),

                          ),

                          Text(
                            '忘记密码?',
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Color.fromARGB(255, 53, 53, 53)
                            ),
                          ),
                        ],
                      ) ,
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
    );
  }
}

class NavigationIconView{
  final BottomNavigationBarItem item;
  final AnimationController controller;

  NavigationIconView({Widget icon,Widget title,TickerProvider vsync}):
      item = new BottomNavigationBarItem(
        icon: icon,
        title: title,
      ),
      controller = new AnimationController(
          duration: kTabScrollDuration,
          vsync: vsync
      );
}

class BottomNavigationWidge extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgeState();
}

class BottomNavigationWidgeState extends State<BottomNavigationWidge>{
  final _bottomNavigationColor = Colors.lightBlue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title:Text(
                '首页',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _bottomNavigationColor,
              ),
              title:Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_file,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '关于',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

