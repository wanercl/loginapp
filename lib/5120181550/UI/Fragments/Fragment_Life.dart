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

class _State_Life extends State<Fragment_Life> with AutomaticKeepAliveClientMixin{

  Life _life;
  int _state=-1;
  int _sel=0;

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    //life=;
    ()async{
      _life=await API.GetLife();
      setState(() {

      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(
          child: _life !=null? Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10,top: 20,right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      _life.title,
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
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: (){
                            if(_state==1){
                              if(_state==_life.answer)
                                return Colors.blue;
                              else
                                return Colors.red;
                            }
                            return null;
                          }()
                        ),
                        child: Text(
                          '正确',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                      onTap: (){
                        if(_state==-1){
                          _state=1;
                          setState(() {
                          });
                        }
                      },
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10,top: 20,right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: (){
                              if(_state==0){
                                if(_state==_life.answer)
                                  return Colors.blue;
                                else
                                  return Colors.red;
                              }
                              return null;
                            }()
                        ),
                        child: Text(
                          '错误',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                      onTap: (){
                        if(_state==-1){
                          _state=0;
                          setState(() {
                          });
                        }
                      },
                    ),
                  )
              )
            ],
          ):Text('')
        ),
        Container(
          height: _state==-1||_state==_life.answer? 0:null,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
            child: Text(
              _life!=null?_life.analyse:'',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20
              ),
            ),
          ),
        ),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Center(
                child: Text(
                  _life!=null?_state==-1||_state==_life.answer?'下一个':'我知道了，下一个':'加载中',
                  style: TextStyle(
                    color: Colors.white ,
                    fontSize: 20
                  ),
                ),
              ),
            ),
            onTap: _onTap,
          ),
        )
      ],
    );
  }

  void _onTap() async{
    _life=await API.GetLife();
    _state=-1;
    setState(() {
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}