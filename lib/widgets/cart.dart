import 'package:app3/pages/homepage.dart';
import 'package:app3/widgets/cartproducts.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())),
          child: Text(
            "Shopping Cart",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: CartProduct(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total", style: TextStyle(fontSize: 20.0),),
                subtitle: Text("\$230", style: TextStyle(fontSize: 16.0),),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
