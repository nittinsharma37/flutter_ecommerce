import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var cartProducts = [
    {
      "name": "Black Dress",
      "picture": "assets/images/products/dress2.jpeg",
      "oldPrice": 1000,
      "price": 800,
      "size": "M",
      "color": "Black",
      "quantity": 2,
    },
    {
      "name": "Red dress",
      "picture": "assets/images/products/dress1.jpeg",
      "oldPrice": 1000,
      "price": 700,
      "size": "L",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Floral skirt",
      "picture": "assets/images/products/skt1.jpeg",
      "oldPrice": 1000,
      "price": 900,
      "size": "xl",
      "color": "multi pattern",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProductName: cartProducts[index]["name"],
            cartProductPicture: cartProducts[index]["picture"],
            cartProductOldPrice: cartProducts[index]["oldPrice"],
            cartPrice: cartProducts[index]["price"],
            cartProductSize: cartProducts[index]["size"],
            cartProductColor: cartProducts[index]["color"],
            cartProductQuantity: cartProducts[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPicture;
  final cartProductOldPrice;
  final cartPrice;
  final cartProductSize;
  final cartProductColor;
  final cartProductQuantity;
  SingleCartProduct({
    this.cartProductName,
    this.cartProductPicture,
    this.cartProductOldPrice,
    this.cartPrice,
    this.cartProductSize,
    this.cartProductColor,
    this.cartProductQuantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image(
          image: AssetImage(cartProductPicture),
          height: 100.0,
          width: 100.0,
          fit: BoxFit.contain,
        ),
        title: Text(cartProductName),
        subtitle: Column(
          children: <Widget>[
            //row inside column
            Row(
              children: <Widget>[
                //this section is used for the size of cart product
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cartProductSize,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                //this section is used for the color of the cart product
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cartProductColor,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            // this section is used for the cart product price
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Rs $cartPrice",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              child: Icon(Icons.arrow_drop_up, size: 20.0,),
              onTap: (){},
            ),
            Text(cartProductQuantity.toString(), style: TextStyle(fontSize: 12.0),),
            InkWell(
              child: Icon(Icons.arrow_drop_down, size: 20.0,),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
