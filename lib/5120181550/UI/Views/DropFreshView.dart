import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DropFreshView extends StatefulWidget{

  Widget child;
  Future<bool> Function() onLoading;
  int timeout;

  DropFreshView({
    this.child,
    this.onLoading,
    this.timeout=3000
  }):assert(child!=null),
    assert(onLoading!=null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_DropFreshView();
  }

}

class _State_DropFreshView extends State<DropFreshView>{

  int _state_fresher=0;

  int _istap=0;

  bool _needfresh=false;

  bool _loaded=false;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification){
              if(_state_fresher!=2){
                if(notification.metrics.pixels-30>notification.metrics.maxScrollExtent){
                  if(_istap!=0){
                    _needfresh=true;
                    _state_fresher=1;
                  }
                  else if(_needfresh){
                    _state_fresher=2;
                    ()async{
                      _loaded=false;
                      Future.delayed(Duration(milliseconds: widget.timeout),(){
                        if(!_loaded){
                          Fluttertoast.showToast(msg: '加载失败!');
                          _state_fresher=0;
                          setState(() {
                          });
                        }
                      });
                      bool f=await widget.onLoading();
                      _loaded=true;
                      if(!f){
                        Fluttertoast.showToast(msg: '加载失败!');
                      }
                      _state_fresher=0;
                    }();
                    _needfresh=false;
                  }
                }
                else{
                  _needfresh=false;
                  _state_fresher=0;
                }
                setState(() {
                });
              }
            },
            child: Listener(
              child: ListView(
                children: [
                  widget.child,
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: (){
                          Widget body;
                          switch(_state_fresher){
                            case 0:
                              body=Text("上拉加载更多");
                              break;
                            case 1:
                              body=Text("松开以加载");
                              break;
                            case 2:
                              body=CircularProgressIndicator();
                              break;
                          }
                          return body;
                      }(),
                    )
                  ),
                ],
                physics: BouncingScrollPhysics()
              ),
              onPointerDown: (t){_istap++;},
              onPointerUp: (t){_istap--;},
            ),
          )
          ,
        );
      },
    );
  }

}