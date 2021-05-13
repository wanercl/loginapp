import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/UI/Pages/Page_Info.dart';
import 'package:loginapp/DataBase.dart';

class GridItem_News extends StatelessWidget{
  
  News n;
  
  GridItem_News(this.n);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Info(n.title,n.url)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0,
                spreadRadius: 1.0
              )
            ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                n.imgurl,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Text(
                n.title,
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              Text(
                n.description,
                style: TextStyle(
                    color: Colors.black26
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  
}