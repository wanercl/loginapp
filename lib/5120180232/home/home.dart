import 'package:flutter/material.dart';
import 'package:loginapp/5120180232/API.dart';
import 'package:loginapp/5120181550/UI/Views/DropFreshView.dart';
import 'package:loginapp/DataBase.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{

  int _page=0;

  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Welcome'),
              IconButton(icon: Icon(Icons.help_outline), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>_help())))
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '个人'
          )
        ],
        currentIndex: _page,
        onTap: (index){
          _page=index;
          _controller.jumpToPage(_page);
          setState(() {

          });
        },
      ),
      body: PageView(
        children: [_page_home(),_page_my()],
        controller: _controller,
      ),
    );
  }
}

class _page_home extends StatefulWidget{

  List<News> mnews=[];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State_home();
  }

}

class _State_home extends State<_page_home>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Loading();
  }

  Future<bool> Loading()async{
    List<News>ns=await API.GetNews();
    if(ns!=null){
      widget.mnews=ns;
      setState(() {
      });
      return true;
    }return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12
      ),
      child: DropFreshView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.mnews.length,
          itemBuilder: ItemBuilder,
          physics: NeverScrollableScrollPhysics(),
        ),
        onLoading: Loading,
      ),
    );
  }

  Widget ItemBuilder(BuildContext context,int index){
    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>_info(widget.mnews[index].title,widget.mnews[index].url)));
        },
        child: Column(
          children: [
            SizedBox(
              height: 110,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: double.infinity,
                          child: Image.network(
                            widget.mnews[index].picUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context,error,stacktrace)=>Text('图片加载失败'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-155,
                                  height: 55,
                                  child: Text(
                                    widget.mnews[index].title,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: Text(
                                    widget.mnews[index].source+' '+widget.mnews[index].ctime,
                                    style: TextStyle(
                                        color: Colors.black26
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

}


class _info extends StatelessWidget{

  String title;
  String url;

  _info(
    this.title,
    this.url
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (!request.url.startsWith('http')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
    );
  }
}

class _page_my extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Image.asset("images/icon_userheader.jpg"),
        Text('邹存玉   女'),
        Text('15508060186'),
        Text('1级'),
      ],
    );
  }
}

class _help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('帮助'),
      ),
      body: Center(
        child: Text('帮相'),
      ),
    );
  }

}