import 'package:flutter/material.dart';
import 'category_details.dart';
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            Image_location: 'assets/logo.jpg',
            Image_caption: 'Brand',

          ),
          Category(
            Image_location: 'assets/logo.jpg',
            Image_caption: 'Brand',
          ),
          Category(
            Image_location: 'assets/logo.jpg',
            Image_caption: 'Brand',
          ),
                   Category(
            Image_location: 'assets/logo.jpg',
            Image_caption: 'Brand',
          ),
          Category(
            Image_location: 'assets/logo.jpg',
            Image_caption: 'Brand',
          ),
          Category(
            Image_location: 'assets/logo.jpg',
            Image_caption: 'Brand',
          ),

        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String Image_location;
  final String Image_caption;

  Category({this.Image_location, this.Image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryDetails()
        ));
      },
      child: Container(
        width: 100,
        child: ListTile(
          title: Image.asset(Image_location,
          width: 100.0,
          height: 80.0),
          subtitle: Container(
            alignment: Alignment.topCenter,
              child: Text(Image_caption)
          ),
        ),
      ),
    ),);
  }
}

