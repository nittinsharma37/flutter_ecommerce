import 'package:app3/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;
  bool loading = false;
  bool isLogedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async{
    setState(() {
      loading = true;
    });
    sharedPreferences = await SharedPreferences.getInstance();
    isLogedIn = await googleSignIn.isSignedIn();
    if(isLogedIn == true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("rthburib"),),
    );
  }
}
