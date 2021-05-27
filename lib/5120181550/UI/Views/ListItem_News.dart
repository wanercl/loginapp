import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Pages/Page_Info.dart';
import 'package:loginapp/DataBase.dart';

class ListItem_News extends StatelessWidget{

  News n;

  ListItem_News(
      this.n
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Info(n.title,n.url)));
      },
      child: Column(
        children: [
          SizedBox(
            height: 108,
            child: Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: double.infinity,
                        child: Image.network(
                          n.picUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context,error,stacktrace)=>Image.asset('images/img_imgloadfailed.jpg'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width-151,
                              height: 26,
                              child: Text(
                                n.title,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width-151,
                              height: 44,
                              child: Text(
                                n.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Text(
                                n.ctime+' '+n.source,
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