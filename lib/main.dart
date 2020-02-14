//import 'dart:html';

import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'cart_bloc.dart';
import 'package:provider/provider.dart';
import 'repository/item_repo.dart';
import 'models/item.dart';
import 'components/item_card.dart';
import 'package:flutter/services.dart' ;

//My own Imports
import 'package:alsyed_bakeries_ecommerce/components/horizontal_list_view.dart';
import 'package:alsyed_bakeries_ecommerce/components/drawerr.dart';
import 'notifications.dart';
import 'profile.dart';
import 'promotions.dart';
import 'settings.dart';
import 'news.dart';
import 'about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ChangeNotifierProvider<CartBloc>(
        create: (context) => CartBloc(),
        child: MaterialApp(
          title: 'Alsayed E-commerce',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/Home': (context) => MyHomePage(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/notifications': (context) => Notifications(),
            '/profile': (context) => Profile(),
            '/promotions': (context) => Promotions(),
            '/settings': (context) => Settings(),
            '/news': (context) => News(),
            '/about': (context) => About(),

          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Login(title: 'Alsayed Bakeries'),
        ));
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFF0277BD),

      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 130.0,),
             Container(
              margin: EdgeInsets.all(20),
               decoration: new BoxDecoration(
                 color: Colors.white,
               
                 borderRadius: new BorderRadius.only(
                   topLeft: new Radius.circular(20.0),
                   bottomLeft: new Radius.circular(20.0),
                   topRight: new Radius.circular(20.0),
                   bottomRight: new Radius.circular(20.0),
                 ),
                ),
              
               child: Column(
                 children: <Widget>[
                   SizedBox(height: 20),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(20.0,5.0, 20.0,5.0),
                     child: Image(
                       image: AssetImage('assets/logo.jpg'),

                     ),
                   ),
                   SizedBox(height: 20),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(20.0,5.0, 20.0,5.0),

                     child: TextFormField(

                       controller: username,
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                           labelText: "User Name",
                           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                           filled: true,
                         //  hintText: "Name",
                      //   icon: Icon(Icons.person),
                       ),
                       validator: (value){
                         if(value.isEmpty){
                           return"Fill Feild";
                         }
                       },
                     ),
                   ),
                   SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(20.0,5.0, 20.0,5.0),

                     child: TextFormField(
                       controller: password,
                       keyboardType: TextInputType.text,
                       obscureText: true,

                       decoration: InputDecoration(
                         //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                           labelText: "Password",

                           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                           filled: true,
                      //     hintText: "Pass",
                        // icon: Icon(Icons.lock),
                       ),
                       validator: (value){
                         if(value.isEmpty){
                           return"Fill Feild";
                         }

                       },
                     ),
                   ),
                   SizedBox(height: 30,),
                   RaisedButton(
                     child: Text ("Login"),
                     color: Colors.blue,
                     shape: StadiumBorder(),
                     onPressed: (){
                       if(_formKey.currentState.validate()){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MyHomePage(username: username.text, password: password.text,)));
                       }
                     },
                   ),
                   SizedBox(height: 5,),
                 ],
               ),
             ),

              ],
            ),
          ),


        ),
      )
    );
  }
}


class MyHomePage extends StatefulWidget {
 MyHomePage({Key key, this.username, this.password}) : super(key: key);

 final String username;
 final String password;
 //@override
// _LoginState createState() => _LoginState();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Item> _items = <Item>[];

  @override
  void initState() {
    super.initState();
    listenForItems();
  }


  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      backgroundColor: Color(0xFF0277BD),
      appBar: AppBar(
        title: Text('Alsayed Bakeries'),
      ),
      drawer: Drawerr(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              //To يباعد between the elements of one row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


                    ],
                  ),
                )
              ],
            ),
          ),



          SizedBox(
            height: 100,
            child: ListView(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(2.0),
                  child: new Text('  Categories',
                      style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Montserrat',
                        // color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)), ),
                //Horizontal list
                HorizontalList(),
              ],

            ),
          ),
          SizedBox(height: 10.0),


          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0), topRight: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 330,
                    child: ListView.builder(

                      itemCount: _items.length,
                      itemBuilder: (context, index) => ItemTile(_items[index]),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child:
                      new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Container(
                          height: 150.0,
                          width: 30.0,
                          child: new GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => CartPage(_items),
                                ),
                              );
                            },
                            child: new Stack(
                              children: <Widget>[
                                new IconButton(icon: new Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                ), onPressed: null,),
                                new Positioned(
                                  child: new Stack(
                                    children: <Widget>[
                                      new Icon(Icons.brightness_1,
                                          size: 20.0, color: Colors.red[700]),
                                      new Positioned(
                                          top: 3.0,
                                          right: 7,
                                          child: new Center(
                                            child: new Text(
                                              '$totalCount',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ],
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                    Container(
                      height: 65.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF1C1428)),
                      child: Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 15.0))),
                    )
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );

  }

  void listenForItems() async {
    final Stream<Item> stream = await getItems();
    stream.listen((Item item) =>
        setState(() =>  _items.add(item))
    );
  }

}