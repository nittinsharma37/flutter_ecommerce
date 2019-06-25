import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  String gender;
  String groupValue = "male";

  bool loading = false;

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
                        //name field here
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "Enter name",
                                icon: Icon(Icons.text_fields),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Name cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //gender field here
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.6,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                      title: Text("Male"),
                                      trailing: Radio(
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e),
                                      ))),
                              Expanded(
                                  child: ListTile(
                                      title: Text("female"),
                                      trailing: Radio(
                                        value: "female",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e),
                                      ))),
                            ],
                          ),
                        ),
                        //email input field here
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.6,
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
                          height: 10.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.6,
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
                        // confirm password field here
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: _confirmPasswordTextController,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
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
                          height: 10.0,
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
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Theme.of(context).primaryColor,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
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

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
      } else if (e == "female") {
        groupValue = e;
      }
    });
  }
}
