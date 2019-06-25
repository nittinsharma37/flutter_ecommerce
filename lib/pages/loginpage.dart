import 'package:app3/pages/homepage.dart';
import 'package:app3/pages/recovery.dart';
import 'package:app3/pages/signup.dart';
import 'package:app3/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
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
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences sharedPreferences;
  bool loading = false;
  bool isLogedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    sharedPreferences = await SharedPreferences.getInstance();
    isLogedIn = await googleSignIn.isSignedIn();
    if (isLogedIn == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    FirebaseUser firebaseUser =
        await firebaseAuth.signInWithCredential(credential);
    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        //insert the user to our collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilepicture": firebaseUser.photoUrl
        });
        await sharedPreferences.setString("id", firebaseUser.uid);
        await sharedPreferences.setString("username", firebaseUser.displayName);
        await sharedPreferences.setString("photoUrl", firebaseUser.displayName);
      } else {
        await sharedPreferences.setString("id", documents[0]['id']);
        await sharedPreferences.setString("username", documents[0]['username']);
        await sharedPreferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Logged In Successful");
      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Fluttertoast.showToast(msg: "Log In failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage(
              'assets/images/backlogin.jpg',
            ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/letsshop.png'),
                        fit: BoxFit.cover,
                        height: 100.0,
                        width: 200.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        //email input field here
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 3.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.email),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              //validator
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                        //password field here
                        SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 3.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Password required to login";
                                } else if (value.length < 6) {
                                  return "Password has to be atleast 6 ";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //login button
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.green.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: MaterialButton(
                                  onPressed: () {},
                                  minWidth:
                                      MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountRecover())),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Forgot ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    "Password?",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                          Text("Sign In With",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.withOpacity(0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: handleSignIn,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        MyFlutterApp.google,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "Google",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xff1122dd).withOpacity(0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        MyFlutterApp.facebook_squared,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "Facebook",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "New User? ",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(
                                      "Sign Up here",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
