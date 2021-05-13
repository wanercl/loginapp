import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loginapp/5120181550/API.dart';
import 'package:loginapp/5120181550/UI/Views/GridItem_News.dart';
import 'package:loginapp/DataBase.dart';
import 'package:loginapp/5120181550/UI/Views/ListItem_News.dart';

class Fragment_Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_Home();
  }
}

class _State_Home extends State<Fragment_Home>  with SingleTickerProviderStateMixin{
  int currentfragment=0;

  TabController _tabController;

  static List<News> news=[];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future(()async{
      if(!news.isEmpty)return;
      news =await API.GetNews();
      setState(() {
      });
    });

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<ListItem_News> items=[];
    List<GridItem_News> grids=[];

    for(News n in news){
      items.add(ListItem_News(n));
      grids.add(GridItem_News(n));
    }

    final List<Widget> fragments=[
      ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context,index)=>items[index],
      ),
      StaggeredGridView.countBuilder(
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: grids.length,
        itemBuilder: (context,index)=>grids[index],
        staggeredTileBuilder: (int index)=>StaggeredTile.fit(1),
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(8),
      )
    ];

    return Column(
      children: [
        Expanded(
          child: fragments[currentfragment]
        ),
        SizedBox(
          height: 25,
          child: Material(
            color: Colors.blue,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Text('列表布局'),
                Text('瀑布布局')
              ],
              onTap: (index)=>{
                if(currentfragment!=index){
                  setState(() {
                    currentfragment=index;
                  })
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}