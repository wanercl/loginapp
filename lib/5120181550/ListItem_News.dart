import 'package:flutter/material.dart';
import 'package:loginapp/5120181550/Page_Help.dart';
import 'package:loginapp/5120181550/Page_Info.dart';

class ListItem_News extends StatelessWidget{
  String title;
  String description;
  String imgurl;

  ListItem_News(
      this.title,
      this.description,
      this.imgurl
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Page_Info(title)));
      },
      child: SizedBox(
        height: 125,
        child: Padding(
          padding: EdgeInsets.only(left: 5,right: 5,top: 5),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                height: double.infinity,
                child: Image.network(
                  imgurl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width-165,
                        height: 100,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          description,
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
      )
    );
  }

}