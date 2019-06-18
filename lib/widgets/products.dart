import 'package:app3/widgets/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Black Dress",
      "picture": "assets/images/products/dress2.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Red Heels",
      "picture": "assets/images/products/hills2.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Blazer  men",
      "picture": "assets/images/products/blazer1.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "blazer female",
      "picture": "assets/images/products/blazer2.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Red dress",
      "picture": "assets/images/products/dress1.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Maroon heels",
      "picture": "assets/images/products/hills1.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Black pant",
      "picture": "assets/images/products/pants1.jpg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Grey pant",
      "picture": "assets/images/products/pants2.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Sniker",
      "picture": "assets/images/products/shoe1.jpg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Floral skirt",
      "picture": "assets/images/products/skt1.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
    {
      "name": "Pink skirt ",
      "picture": "assets/images/products/skt2.jpeg",
      "oldPrice": 1000,
      "price": 700,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productOldPrice: productList[index]['oldPrice'],
          price: productList[index]['price'],
        );
      },
      itemCount: productList.length,
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final price;
  SingleProduct({
    this.productName,
    this.productPicture,
    this.productOldPrice,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () {
              return Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(
                //passing values from one route to other 
                productDetailsName: productName,
                productDetailsPicture: productPicture,
                productDetailsOldPrice: productOldPrice,
                productDetailsPrice: price,
              )));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ),
                    Text(
                      "Rs $price",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "  Rs $price",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        letterSpacing: 1.2,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              child: Image.asset(productPicture, fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
