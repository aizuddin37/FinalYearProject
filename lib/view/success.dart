import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justmarryapp/help/ui.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}
class _SuccessPageState extends State<SuccessPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 60,vertical: 184),


        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  padding:EdgeInsets.only(top:100),
                  height: 200,
                  decoration: BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/success.png"),
                      fit:BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium(),
              Center(
                child: Text("Login Success!",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber[500],
                  fontSize: 18,
                ),),
              ),

              Center(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: (){
                    Get.toNamed('home');
                  },
                  color: Colors.amber[500],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Back to Home",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );

  }
  }