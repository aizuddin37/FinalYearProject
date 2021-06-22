import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageP extends StatefulWidget {
  @override
  _WebPagePState createState() => _WebPagePState();
}

class _WebPagePState extends State<WebPageP> {
  WebViewController webViewCtrl;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

        onWillPop: () {
          return showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => new AlertDialog(
                content: Text("Are you sure you want to go to home page?"),
                title: Text("Warning"),
                actions: [
                  new FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                      // if (_scaffoldKey.currentState.isDrawerOpen) {
                      //   Data.sharedPref.setBool('autoLogin', false);
                      //   Navigator.of(context)
                      //     ..pop()
                      //     ..pop()
                      //     ..pushReplacementNamed('login');
                      // } else {
                      //   Data.sharedPref.setBool('autoLogin', false);
                      //   Navigator.of(context)
                      //     ..pop()
                      //     ..pushReplacementNamed('login');
                      // }
                      // exit the app -> SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                    child: new Text('Yes'),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('No'),
                  ),
                ],
              ));
          // return Future.value(false);
        },
        child:
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pushNamed(context, '/'); // Original
              },
            ),
            iconTheme: IconThemeData(color: Colors.amber),
            backgroundColor: Colors.white,
            title: new Text(
              "Pulau Pinang",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: WebView(
            initialUrl: "https://app.powerbi.com/view?r=eyJrIjoiYjY5NWFlMmMtYmMzNi00YTAwLTg1YmItNjI3YmFkOGI3YTBmIiwidCI6ImNkY2JiMGUyLTlmZWEtNGY1NC04NjcwLTY3MjcwNzc5N2FkYSIsImMiOjEwfQ%3D%3D",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              webViewCtrl = controller;
            },
          ),
        ));
  }
}