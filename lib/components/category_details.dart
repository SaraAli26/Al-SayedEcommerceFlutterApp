import 'package:flutter/material.dart';
import '../cart_bloc.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../main.dart';

class CategoryDetails extends StatefulWidget {

 // final Item item;

  CategoryDetails();


  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<CategoryDetails> {

  var selectedCard = 'WEIGHT';
  var one = 0;


  @override
  Widget build(BuildContext context) {
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
        title: Text('Category Details',
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

