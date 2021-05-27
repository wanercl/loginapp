import 'package:flutter/material.dart';

class TopListBar extends StatefulWidget{

  static const int _TYPE_NORMAL=0;
  static const int _TYPE_BUILDER=1;

  int _type=_TYPE_NORMAL;

  List<String> texts;
  void Function(int index) _onItemTap;
  int currentindex=0;

  Color _Selectedbackcolor;
  Color _Unselectedbackcolor;
  Color _Selectedcolor;
  Color _Unselectedcolor;

  EdgeInsets _padding;

  double _height;

  TextStyle _style;

  _TopListBar(){}

  TopListBar({
    this.texts,
    void Function(int index) onItemTap,
    Color Selectedbackcolor,
    Color Unselectedbackcolor,
    Color Selectedcolor,
    Color Unselectedcolor,
    EdgeInsets padding,
    TextStyle style,
    double height
  }) {
    assert(texts != null);
    assert(height!=null);
    _type=_TYPE_NORMAL;

    _onItemTap=onItemTap;

    _Selectedcolor=Selectedcolor ?? Colors.blue;
    _Selectedbackcolor=Selectedbackcolor ?? Colors.white;

    _Unselectedcolor=Unselectedcolor ?? Colors.white;
    _Unselectedbackcolor=Unselectedbackcolor ?? Colors.blue;

    _padding=padding ?? EdgeInsets.all(5);

    _style=style ?? TextStyle();

    _height = height;

  }

  @override
  State<StatefulWidget> createState() {

    switch(_type){
      case _TYPE_NORMAL:
        return _State_TopListBar_NORMAL();
      case _TYPE_BUILDER:
        return _State_TopListBar_BUILDER();
    }
    print(_type);
  }


  Widget Function(BuildContext context,int index) _itembuilder;
  int itemcounts;

  TopListBar.builder({
    this.itemcounts,
    Widget Function(BuildContext context,int index) itembuilder,
    double height,
    void Function(int index) onItemTap,
  }){
    assert(itemcounts!=null);
    assert(itembuilder!=null);
    assert(height!=null);
    _itembuilder=itembuilder;
    _height=height;
    _type=_TYPE_BUILDER;
    _height=height;
    _onItemTap=onItemTap;
  }

}

class _State_TopListBar_NORMAL extends State<TopListBar>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: widget._height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.texts.length,
        itemBuilder: (context,index){
          return InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: index==widget.currentindex ? widget._Selectedbackcolor:widget._Unselectedbackcolor
              ),
              child: Center(
                child: Padding(
                  padding: widget._padding,
                  child: Text(
                    widget.texts[index],
                    style: widget._style.merge(TextStyle(
                        color: index==widget.currentindex ? widget._Selectedcolor:widget._Unselectedcolor
                    )),
                  ),
                ),
              ),
            ),
            onTap: (){
              if(index!=widget.currentindex){
                widget.currentindex=index;
                if(widget._onItemTap!=null)
                  widget._onItemTap(index);
                setState(() {});
              }
            },
          );
        },
      ),
    );
  }

}

class _State_TopListBar_BUILDER extends State<TopListBar>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: widget._height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemcounts,
        itemBuilder: (context,index){
          return InkWell(
            child: widget._itembuilder(context,index),
            onTap: (){
              if(widget._onItemTap!=null)
                widget._onItemTap(index);
            },
          );
        },
      ),
    );
  }

}