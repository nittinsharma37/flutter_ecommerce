import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'assets/images/cats/dress.png',
            imageCaption: 'Dress',
            onTapCall: (){},
          ),
          Category(
            imageLocation: 'assets/images/cats/formal.png',
            imageCaption: 'Formal',
            onTapCall: (){},
          ),
          Category(
            imageLocation: 'assets/images/cats/informal.png',
            imageCaption: 'Informal',
            onTapCall: (){},
          ),
          Category(
            imageLocation: 'assets/images/cats/accessories.png',
            imageCaption: 'Accessories',
            onTapCall: (){},
          ),
          Category(
            imageLocation: 'assets/images/cats/jeans.png',
            imageCaption: 'Jeans',
            onTapCall: (){},
          ),
          Category(
            imageLocation: 'assets/images/cats/shoe.png',
            imageCaption: 'Shoe',
            onTapCall: (){},
          ),
          Category(
            imageLocation: 'assets/images/cats/tshirt.png',
            imageCaption: 'T-Shirts',
            onTapCall: (){},
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  final onTapCall;
  Category({
    this.imageLocation,
    this.imageCaption,
    this.onTapCall,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onTapCall,
        child: Container(
          width: 120.0,
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ListTile(
            title: Image(
              image: AssetImage(imageLocation),
              height: 70.0,
            ),
            subtitle: Text(imageCaption, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 15.0),),
          ),
            ],
          ),
        ),
      ),
    );
  }
}