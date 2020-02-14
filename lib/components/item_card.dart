import 'package:flutter/material.dart';
import '../models/item.dart';
import '../cart_bloc.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'item_details.dart';

class ItemTile extends StatelessWidget {
  final Item _item;

  ItemTile(this._item);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(_item.name),
            subtitle: Text(_item.tagline),
            leading: Container(
                margin: EdgeInsets.only(left: 6.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(_item)
                    ));
                  },
                  child: Hero(
                    tag:  _item.id,
                    child: Image.network(
                      _item.image_url, height: 50.0, fit: BoxFit.fill,)
                  ),
                ),
              /*GestureDetector(
                  child: Image.network(
                    _item.image_url, height: 50.0, fit: BoxFit.fill,),
                  onTap: (){

                  },
                )*/

            ),
            trailing: IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: (){
                bloc.addToCart(_item.id);
              },
            ),

          ),
          Divider()
     ],
        );
}
/*  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Container(
      height: 600,
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: new GridView.count(
            crossAxisSpacing: 15,
            mainAxisSpacing: 30,
            crossAxisCount: 2,
            padding: EdgeInsets.all(15.0),
            children: List.generate(6, (index) {
              return Container(
                child: new Card(
                  elevation: 10.0,
                  child: new Column(
                    children: <Widget>[

                      new Image.network(_item.image_url, height: 50.0, fit: BoxFit.fill,),
                      //   new SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(width: 43,),
                          IconButton(
                            icon: Icon(Icons.add_box),
                            color: Colors.green,
                            onPressed: () {
                              bloc.addToCart(_item.id);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.indeterminate_check_box),
                            color: Colors.red,
                            onPressed: () {
                              bloc.removeFromCart(_item.id);
                            },
                          )
                        ],
                      )

                    ],
                  ),
                ),
              );
            }),
          ),



    );
  }*/
}