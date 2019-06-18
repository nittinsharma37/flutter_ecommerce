import 'package:app3/widgets/cart.dart';
import 'package:app3/widgets/horizontallist.dart';
import 'package:app3/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        secondaryHeaderColor: Colors.deepPurpleAccent,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200.0,
      width: double.infinity,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("assets/images/c1.jpg"),
          AssetImage("assets/images/m1.jpeg"),
          AssetImage("assets/images/m2.jpg"),
          AssetImage("assets/images/w1.jpeg"),
          AssetImage("assets/images/w3.jpeg"),
          AssetImage("assets/images/w4.jpeg"),
        ],
        autoplay: false,
        //autoplayDuration: Duration(seconds: 3),
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 500),
        dotSize: 5.0,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.black12,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage())),
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
          SizedBox(
            width: 10.0,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
            },
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //header
            UserAccountsDrawerHeader(
              accountName: Text("john doe"),
              accountEmail: Text("john@doe.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            //body
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              child: ListTile(
                title: Text("shopping Cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(
                  Icons.favorite,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings, size: 30.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  size: 30.0,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          //image carrousel view
          imageCarousel,
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          //horizontal list view
          HorizontalList(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Recent Products",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          //grid view
          Container(
            height: 400.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}

