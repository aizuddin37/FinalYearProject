



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justmarryapp/help/ui.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
                            "Choose your city",
                            textAlign:TextAlign.center,
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,

                            ),
                          ),
                          SizedBox(
                            height:20,
                          ),
                          Text("This section shows which cities you want to see for temperature prediction",
                            textAlign:TextAlign.center,
                            style:TextStyle(
                              color: Colors.amber[700],
                              fontSize: 15,
                            ),)
                        ],
                      ),
                     UIHelper.verticalSpaceMedium(),
                      Column(
                          children:<Widget>[
                            //login
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed:(){
                                Get.toNamed('chart');
                              },
                              color: Colors.amber[500],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                  "Selangor",
                                  style:TextStyle(
                                    color: Colors.white,
                                  )
                              ),


                            ),

                            UIHelper.verticalSpaceSmall(),

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
                                    "Johor Bahru, Johor",
                                    style:TextStyle(
                                      color: Colors.white,
                                    )
                                ),
                            ),

                            UIHelper.verticalSpaceSmall(),

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
                                  "Kota Bharu , Kelantan",
                                  style:TextStyle(
                                    color: Colors.white,
                                  )
                              ),
                            ),

                            UIHelper.verticalSpaceSmall(),

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
                                  "Kuala Terengganu, Terengganu",
                                  style:TextStyle(
                                    color: Colors.white,
                                  )
                              ),
                            ),

                            UIHelper.verticalSpaceSmall(),

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
                                  "Pulau Pinang",
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