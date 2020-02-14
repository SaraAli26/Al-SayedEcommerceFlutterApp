import 'package:flutter/material.dart';
import '../main.dart';

class Drawerr extends StatelessWidget {

  navigateToPage(BuildContext context, String page) {
    Navigator.of(context).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("xyz"),
            accountEmail: Text("xyz@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("xyz"),
            ),
            /* otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("abc"),
                )
              ],*/
          ),
        /*  ListTile(
            title: new Text("Home"),
            leading: new Icon(Icons.home),
            onTap: () => navigateToPage(context, 'home')
          ),*/
          ListTile(
            title: new Text("My Profile"),
            leading: new Icon(Icons.person),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          /* Divider(
              height: 0.1,
            ),*/
          ListTile(
            title: new Text("Notifications"),
            leading: new Icon(Icons.notifications_active),
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            title: new Text("News"),
            leading: new Icon(Icons.pageview),
            onTap: () {
              Navigator.pushNamed(context, '/news');
            },
          ),
          ListTile(
            title: new Text("Promotions & Discounts"),
            leading: new Icon(Icons.attach_money),
            onTap: () {
              Navigator.pushNamed(context, '/promotions');
            },
          ),
          Divider(),
          ListTile(
            title: new Text("Settings"),
            leading: new Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: new Text("About"),
            leading: new Icon(Icons.help),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),

        ],
      ),
    );
  }
}



