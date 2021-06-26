import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:justmarryapp/api_repo/user.dart';
import 'package:justmarryapp/model/data.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{
  final emailController = new TextEditingController();
  final passController = new TextEditingController();
  final fController = new TextEditingController();
  final cpassController = new TextEditingController();
  final lController = new TextEditingController();
  User _user;

  @override
  Widget build(BuildContext context){
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness:Brightness.light,
        backgroundColor:Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);

          },
          icon: Icon(Icons.arrow_back,
            size: 20,
            color:Colors.black,),
        ),

      ),
      body: SingleChildScrollView(
        child:Container(
        height:MediaQuery.of(context).size.height,
        width: double.infinity,
        child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children:<Widget>[
                        Container(
                          padding:EdgeInsets.only(top:100),
                          height: 160,
                          decoration: BoxDecoration(
                            image:DecorationImage(
                              image: AssetImage("assets/signup.png"),
                              fit:BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Text("SignUp",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                        SizedBox(height: 20,),
                        Text("Make your own account",style: TextStyle(
                            fontSize: 15,
                            color: Colors.amber[700]
                        ),),

                      ],

                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                                inputRegisterFilef(label:"FirstName"),
                                inputRegisterFilel(label:"LastName"),
                                inputRegisterFilee(label:"Email"),
                                inputRegisterFilep(label:"Password",obscureText:true),
                                inputRegisterFilec(label: "Confirm Password",obscureText:true)
                             ],
                            ),
                    ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Container(
                        padding: EdgeInsets.only(top: 2,left:3),
                        decoration:
                        BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )

                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: (){

                            signUp(fController.text,lController.text,emailController.text, passController.text);
                          },
                          color: Colors.amber[500],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(50),
                          ),
                          child: Text(
                            "SignUp",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("By signing up you have agreed  of this app "),
                            Text("Terms and service",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.amber[500],
                              fontSize: 10,
                            ),),

                          ],
                        ),
                        Text("of this app "),
                      ],
                    ),




                  ]
              ))

      ),
        );



  }
  signUp(String fName,String lName,String email, String password) async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    var jsonData = null;

    Map data = {
      'email': email,
      'password': password,
    };

    Map<String, String> authorHeader = {
      'Content-Type': 'application/json; charset=UTF-8',

    };

    String requestData = "{";
    requestData += "\"firstName\": \"" + fController.text + "\" ";
    requestData += "\"lastName\": \"" + lController.text + "\" ";
    requestData += "\"email\": \"" + emailController.text + "\" ";
    requestData += ", \"password\": \"" + passController.text + "\" ";
    requestData += "}";
    print("requestData : " + requestData);

    final response = http.post(
        "http://13.228.175.39:89/justmarry/api/create_account",
        body: requestData,headers: authorHeader);

    response.then((_response) => {
      print(_response),
      print(_response.body.toString()+"first:"+fController.text+"last:"+lController.text+"emai:"+emailController.text+"pass:"+passController.text ),
      if (_response.statusCode != 200)

        {
              showDialog(
              context: context,
          builder: (context) => AlertDialog(
          title: Text("Failed to Login."),
          content: Text("Please try again"),
          ),),
        }
      // else if(cpassController.text != passController.text)
      //   {
      //     print("password does not match with confirm password."),
      //     // Get.toNamed('success'),
      //   }
      else
        {
        setState(()
    {
      _user = User.fromJson(json.decode(_response.body));


      // save user data locally
      Data.sharedPref.setString("firstName", fController.text);
      Data.sharedPref.setString("lastName", lController.text);
      Data.sharedPref.setString("email", emailController.text);
      Data.sharedPref.setString("password", passController.text);
      Get.toNamed('login');
    }),
        }
    });
  }

  Widget inputRegisterFilef({label, obscureText =false})
  {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87
          ),

        ),
        SizedBox(
          height: 5,
        ),

        TextFormField(
          controller: fController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget inputRegisterFilel({label, obscureText =false})
  {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87
          ),

        ),
        SizedBox(
          height: 5,
        ),

        TextFormField(
          controller: lController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget inputRegisterFilee({label, obscureText =false})
  {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87
          ),

        ),
        SizedBox(
          height: 5,
        ),

        TextFormField(
          obscureText: obscureText,
          controller: emailController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget inputRegisterFilep({label, obscureText =false})
  {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87
          ),

        ),
        SizedBox(
          height: 5,
        ),

        TextFormField(
          obscureText: obscureText,
          controller: passController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget inputRegisterFilec({label, obscureText =false})
  {
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87
          ),

        ),
        SizedBox(
          height: 5,
        ),

        TextFormField(
          controller: cpassController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey[400]
              ),
            ),
          ),
        ),

      ],
    );
  }
}

