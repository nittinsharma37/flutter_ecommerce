
import 'package:app3/pages/loginpage.dart';
import 'package:flutter/material.dart';

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
      home: Login(),
    );
  }
}


