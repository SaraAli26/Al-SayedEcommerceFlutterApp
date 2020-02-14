import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 60.0,),
            Stack (
              children: <Widget>[
                CircleAvatar (
                  backgroundColor: Colors.blue,
                  radius: 60,
                  child: Icon (
                    Icons.person,
                    size: 110,

                  ),
                ),
                GestureDetector (
                  onTap: (){
                  },
                  child: Container (
                    width: 120,
                    height: 120,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text("Sara Ahmed",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20)
            ),
            SizedBox(height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      new Icon(Icons.star),
                      SizedBox(height: 25.0,),
                      new Text("50"),
                      SizedBox(height: 10.0,),
                      new Text("Orders"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      new Icon(Icons.ac_unit),
                      SizedBox(height: 25.0,),
                      new Text("13"),
                      SizedBox(height: 10.0,),
                      new Text("Visits"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      new Icon(Icons.filter_vintage),
                      SizedBox(height: 25.0,),
                      new Text("9"),
                      SizedBox(height: 10.0,),
                      new Text("Points"),
                    ],
                  ),
                ),
              ],
            ),
          ]
      ),

    );
  }
}
