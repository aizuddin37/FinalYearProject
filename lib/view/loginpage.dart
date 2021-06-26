



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Size sizeDevice;
  bool checkVerified = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:SafeArea(
            child:Container(

                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding:EdgeInsets.symmetric(horizontal:30,vertical: 50),
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Welcome to My Weather",
                            textAlign:TextAlign.center,
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,

                            ),
                          ),
                          SizedBox(
                            height:20,
                          ),
                          Text("Where your knowledge of weather is in the palm of your hands!",
                            textAlign:TextAlign.center,
                            style:TextStyle(
                              color: Colors.amber[700],
                              fontSize: 15,
                            ),)
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/3,
                        decoration: BoxDecoration(
                            image:DecorationImage(
                                image:AssetImage(
                                    "assets/logoapp.png"
                                )
                            )
                        ),
                      ),
                      Column(
                        children:<Widget>[
                          //login
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed:(){
                              Get.toNamed('weather');
                            },
                              color: Colors.amber[500],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  "Let's get started!",
                                style:TextStyle(
                                  color: Colors.white,
                                )
                                ),

                              ),
                          //signup
                          // SizedBox(height: 20),
                          // MaterialButton(minWidth: double.infinity,
                          // height: 60,
                          //     onPressed: (){
                          //       Get.toNamed('signup');
                          //     },
                          //   color: Colors.amber[500],
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(50),
                          //   ),
                          //   child: Text(
                          //     "Sign Up",
                          //   style:TextStyle(
                          //     color: Colors.white,
                          //   )
                          //   ),

                          // ),
                        ]
                      )
                    ]


                )

            )
        )
    );
  }
}


