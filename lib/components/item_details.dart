import 'package:flutter/material.dart';
import '../cart_bloc.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../main.dart';
import 'package:alsyed_bakeries_ecommerce/cart_page.dart';

class DetailsPage extends StatefulWidget {

  final Item item;

  DetailsPage(this.item);


  @override
  _DetailsPageState createState() => _DetailsPageState();

}

class _DetailsPageState extends State<DetailsPage> {
  var count = 0 ;
  var selectedCard = 'WEIGHT';
  var one = 0;


  @override
  Widget build(BuildContext context) {

     List<Item> _items;

    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;
   // int giftIndex = cart.keys.toList()[widget.item.srm];
     if(cart[widget.item.id] == null){
       count = 0 ;
     }
     else{
       count = cart[widget.item.id];
     }


    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }

    return Scaffold(
      backgroundColor: Color(0xFF0277BD),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 25.0, color: Colors.white
            )),
        centerTitle: true,
        actions: <Widget>[

        ],
      ),
      body: ListView(
        children: [
          Stack(
            children:[
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white
                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                  tag: widget.item.id,
                  child: Container(
                      child: Image.network(widget.item.image_url),
                      height: 200.0,
                      width: 200.0
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.item.name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.item.tagline ,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.grey
                            )),
                        Container(
                          height: 25.0, color: Colors.grey, width: 1.0,
                        ),
                        Container(
                          width: 125.0,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: Color(0xFF0277BD)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: (){},
                                child: Container(

                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.remove,
                                        size: 20.0,),
                                      color: Colors.white,

                                      onPressed: (){
                                        bloc.removeFromCart(widget.item.id);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                  '$count',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                  )),
                              InkWell(
                                onTap: (){},
                                child: Container(


                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.add,
                                      size: 20.0,),
                                      color: Colors.white,

                                      onPressed: (){
                                        bloc.addToCart(widget.item.id);
                                      },
                                    ),


                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.0),
                    Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard('WEIGHT', '300', 'G'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('CALORIES', '267', 'CAL'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('AVAIL', 'NO', 'AV'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('FGFG', 'HG', 'Y'),
                          ],
                        )
                    ),
                    SizedBox(height: 60.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)
                            ),
                            color: Colors.black
                        ),
                        height: 50.0,
                        child: RaisedButton(
                          color: Colors.black,
                          shape: StadiumBorder(),
                          onPressed: (){
                            Navigator.pushNamed(context, '/Home');
                          },
                          child: Center(
                            child: Text(
                              'Main Menu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInCirc,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedCard ? Color(0xFF0277BD) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard ?
                  Colors.transparent :
                  Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75
              ),

            ),

            //Comment
            height: 140.0,
            width: 140.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 13.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: cardTitle == selectedCard ? Colors.white : Colors.grey.withOpacity(0.7),
                        )),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}

