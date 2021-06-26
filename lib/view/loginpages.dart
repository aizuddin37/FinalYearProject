import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:justmarryapp/api_repo/user.dart';
import 'package:justmarryapp/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User _user;
  SharedPreferences SharedPref;
  final emailController = new TextEditingController();
  final passController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Oh no!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You need to login your account to enter this part.",
                          style:
                              TextStyle(fontSize: 15, color: Colors.amber[700]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          Form(
                            child: Column(
                              children: [
                                inputFilee(label: "Email"),
                                inputFilep(label: "Password", obscureText: true)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 2, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            signIn(emailController.text, passController.text);
                            // Get.toNamed('success');
                          },
                          color: Colors.amber[500],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        InkWell(
                          onTap: (){
                            Get.toNamed('signup');
                          },
                          child:Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.amber[500],
                            fontSize: 18,

                          ),
                        ),
                      ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/login.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ]))
            ]),
      ),
    );
  }

  signIn(String email, String password) async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    var jsonData = null;

    Map data = {
      'email': email,
      'password': password,
    };

    String requestData = "{";
    requestData += "\"email\": \"" + emailController.text + "\" ";
    requestData += ", \"password\": \"" + passController.text + "\" ";
    requestData += "}";
    print("requestData : " + requestData);

    String v ="http://13.228.175.39:89/justmarry/api/login_account?email="+emailController.text+"&password="+passController.text;
    final response = http.get(v);
    print(v);

    response.then((_response) => {
      print(_response.body.toString()),
          if (_response.statusCode != 200)

            {
              //     showDialog(
              //     context: context,
              // builder: (context) => AlertDialog(
              // title: Text("Failed to Login."),
              // content: Text("Please try again"),
              // );
            }
          else
            {
              print("Attempting to login Succesful"),
              Get.toNamed('success'),
            }
        });
  }

  Widget inputFilee({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: emailController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputFilep({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: passController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }
}
