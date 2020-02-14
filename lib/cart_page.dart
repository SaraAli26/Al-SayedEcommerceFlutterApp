import 'package:flutter/material.dart';
import 'cart_bloc.dart';
import 'package:provider/provider.dart';
import 'models/item.dart';
import 'main.dart';

class CartPage extends StatelessWidget {
  final List<Item> item;
  int total = 0;

 // CartPage({Key key, this.item}) : super(key: key);
  CartPage(this.item);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(23.0),
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex];
          total =  count * item[giftIndex-1].srm;
          return Card(
            child: ListTile(
              leading: Container(
                height: 70,
                width: 70,
               child: Image.network(item[giftIndex-1].image_url, height: 50.0, fit: BoxFit.fill,)
              ),
              title: Text('Quantity: $count',),
              subtitle: Text(item[giftIndex-1].name),
              trailing: RaisedButton(
                child: Text('Remove'),
                color: Theme.of(context).buttonColor,
                elevation: 1.0,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  bloc.clear(giftIndex);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total"),
              subtitle: new Text('SDG $total'),
            ),),
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("Check out" , style: TextStyle(color: Colors.white)),
                color: Colors.blue,),
            )
          ],
        ),
      ) ,
    );
  }
}