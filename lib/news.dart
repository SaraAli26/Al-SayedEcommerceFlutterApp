import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(
                  Icons.star
              ),
              title: Text("News 1", style: TextStyle(fontStyle: FontStyle.normal)),
              subtitle: Text("12/15/2019    08:00 PM", style: TextStyle(fontStyle: FontStyle.italic)) ,
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                  Icons.star
              ),
              title: Text("News 2"),
              subtitle: Text("19/15/2019    04:00 PM", style: TextStyle(fontStyle: FontStyle.italic)) ,
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                  Icons.star
              ),
              title: Text("News 3", style: TextStyle(fontStyle: FontStyle.normal)),
              subtitle: Text("01/01/2020    06:00 PM", style: TextStyle(fontStyle: FontStyle.italic)) ,
            ),
          ),

        ],


      )
    );
  }
}
