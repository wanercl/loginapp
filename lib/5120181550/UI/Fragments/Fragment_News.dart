import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/5120181550/API.dart';
import 'package:loginapp/5120181550/UI/Views/DropFreshView.dart';
import 'package:loginapp/5120181550/UI/Views/GridItem_News.dart';
import 'package:loginapp/5120181550/UI/Views/ListItem_News.dart';
import 'package:loginapp/5120181550/UI/Views/TopListBar.dart';
import 'package:loginapp/DataBase.dart';

class Fragment_News extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_News();
  }

}

class _State_News extends State<Fragment_News> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  int currentfragment=0;

  TabController _tabController;

  static _State_News _instanse;

  _State_News(){
    _instanse=this;
  }

  static List<News> news=[];
  static List<ListItem_News> items=[];
  static List<GridItem_News> grids=[];
  static List<Widget> fragments=[_Fragment_List(items),_Fragment_Grid(grids)];

  Future<bool> _onLoading() async {
    // monitor network fetch
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    List<News> ns =await API.GetNews();
    if(ns==null)return false;
    for(News n1 in ns){
      bool flag=true;
      for(News n2 in news){
        if(n2.id==n1.id){
          flag=false;
          break;
        }
      }
      if(flag){
        news.add(n1);
        items.add(ListItem_News(n1));
        grids.add(GridItem_News(n1));
      }
    }
    if (mounted) setState(() {
    });
    (fragments[0] as _Fragment_List).NotifyDatasetChanged();
    (fragments[1] as _Fragment_Grid).NotifyDatasetChanged();
    return true;
  }

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0,keepPage: true);
        ()async{
      if(!news.isEmpty)return;
      news =await API.GetNews();
      for(News n in news){
        items.add(ListItem_News(n));
        grids.add(GridItem_News(n));
      }
      setState(() {
      });
      (fragments[0] as _Fragment_List).NotifyDatasetChanged();
      (fragments[1] as _Fragment_Grid).NotifyDatasetChanged();
    }();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(
            child: PageView(
              children: fragments,
              controller: _pageController,
            )
        ),
        SizedBox(
          height: 25,
          child: Material(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black38,
              tabs: [
                Text('列表布局'),
                Text('瀑布布局')
              ],
              onTap: (index)=>{
                if(currentfragment!=index){
                  setState(() {
                    print('jumpto'+index.toString());
                    _pageController.jumpToPage(index);
                    currentfragment=index;
                    if(index==0){
                      (fragments[0] as _Fragment_List).NotifyDatasetChanged();
                    }else{
                      (fragments[1] as _Fragment_Grid).NotifyDatasetChanged();
                    }
                  })
                }
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}


class _Fragment_List extends StatefulWidget{

  List<Widget> _items;

  _Fragment_List(this._items){
    _state=_State_Fragment_List();
  }

  State<_Fragment_List> _state;

  void NotifyDatasetChanged(){
    if(_state.mounted)
      _state.setState(() {
      });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _state;
  }

}

class _State_Fragment_List extends State<_Fragment_List> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropFreshView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget._items.length,
        itemBuilder: (context,index)=>widget._items[index],
        physics: NeverScrollableScrollPhysics(),
      ),
      onLoading: _State_News._instanse._onLoading,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}


class _Fragment_Grid extends StatefulWidget{

  List<Widget> _items;

  _Fragment_Grid(this._items) {
    _state=_State_Fragment_Grid();
  }

  State<_Fragment_Grid> _state;

  void NotifyDatasetChanged(){
    if(_state.mounted)
      _state.setState(() {
      });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _state;
  }

}

class _State_Fragment_Grid extends State<_Fragment_Grid> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropFreshView(
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: widget._items.length,
          itemBuilder: (context,index)=>widget._items[index],
          staggeredTileBuilder: (int index)=>StaggeredTile.fit(1),
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(8),
          physics: NeverScrollableScrollPhysics(),
        ),
        onLoading: _State_News._instanse._onLoading
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}