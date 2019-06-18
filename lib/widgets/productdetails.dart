import 'package:app3/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsPicture;
  final productDetailsOldPrice;
  final productDetailsPrice;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsPicture,
      this.productDetailsOldPrice,
      this.productDetailsPrice});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())),
          child: Text(
            "Let's Shop",
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
          SizedBox(width: 10.0,),
        ],
      ),
      //body
      body: ListView(
        children: <Widget>[
          Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  child: Image.asset(
                    widget.productDetailsPicture,
                    fit: BoxFit.contain,
                  ),
                ),
                footer: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  child: ListTile(
                    leading: Text(
                      widget.productDetailsName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Rs ${widget.productDetailsOldPrice}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Rs ${widget.productDetailsPrice}",
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          //Ist button
          Row(
            children: <Widget>[
              //sizebutton
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("size"),
                              content: Text("Select Size"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    elevation: 5.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Size")),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    )),
              ),
              //color button
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Color"),
                              content: Text("Select Color"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    elevation: 5.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Color")),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    )),
              ),
              //quantity button
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Quantity"),
                              content: Text("Select Quantity"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    elevation: 5.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Qty.")),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          //Second button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //color button
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Theme.of(context).primaryColor,
                        size: 25.0,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text(
              "Product details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product name",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.productDetailsName,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product Brand",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              //TODO: create product brand
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("xxxx",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product Condition",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              //TODO: create product condition
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("xxxxxxxx",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              )
            ],
          ),
          Divider(),
           Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Recent Products",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Divider(),
          Container(
            height: 400.0,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
        return SimilarSingleProduct(
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

class  SimilarSingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final price;
   SimilarSingleProduct({
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


